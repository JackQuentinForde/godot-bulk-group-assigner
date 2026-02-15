@tool
extends Node

@export_file("*tscn") var sceneFile : String
@export var nodePrefix : String = ""
@export var groups : Array[String] = []
@export var overwriteScene : bool = false ##When true, the original scene file will be overwritten. When false, a new scene file with the "_modified" suffix will be created in the same directory. Be very careful when enabling this option, as it may corrupt your scene if something goes wrong. If you are not using source control, it is highly recommended to keep this option disabled and review the changes in the newly created file before replacing the original scene.
@export var runProcessing : bool = false : set = setRunProcessing

func setRunProcessing(value : bool) -> void:
	if value == true:
		runProcessing = false
		var fullNodePrefix = "[node name=\"" + nodePrefix
		processFile(fullNodePrefix)

func processFile(prefix : String) -> void:
	if not FileAccess.file_exists(sceneFile):
		push_error("Scene file not found: %s" % sceneFile)
		return

	var readFile = FileAccess.open(sceneFile, FileAccess.READ)
	var content = readFile.get_as_text()
	readFile.close()

	var lines = content.split("\n")
	
	var groupsPart = ""
	if groups.size() > 0:
		groupsPart = " groups=[\"" + groups[0] + "\""

		if groups.size() > 1:
			for i in range(1, groups.size()):
				groupsPart += ",\"" + groups[i] + "\""
			if groupsPart.contains("]"):
				push_error("Groups must not have closing brackets (]) in their names.")
				return
		groupsPart += "]"

	var changesPending = false

	for i in range(lines.size()):
		var line = lines[i]

		if line.begins_with(prefix):
			var newLine = ""

			if line.contains("groups=["):
				var startIndex = line.find(" groups=[")
				var endIndex = line.find("]", startIndex)

				if endIndex == -1:
					push_error("Malformed groups assignment in line: " + line)
					return
					
				newLine = line.substr(0, startIndex) + groupsPart + line.substr(endIndex + 1)
			else:
				newLine = line.rstrip("]") + groupsPart + "]"

			if line == newLine:
				continue
				
			lines[i] = newLine
			changesPending = true
			print("Changing " + line + " to " + newLine)

	if changesPending:
		var newContent = "\n".join(lines)

		var writeFile : FileAccess
		if overwriteScene:
			print("Overwriting original scene file: " + sceneFile)
			writeFile = FileAccess.open(sceneFile, FileAccess.WRITE)
		else:
			var newFile = sceneFile.get_base_dir() + "/" + sceneFile.get_file().get_basename() + "_modified.tscn"
			print("Writing changes to " + newFile)
			writeFile = FileAccess.open(newFile, FileAccess.WRITE)

		writeFile.store_string(newContent)
		writeFile.close()
		print("Group assignment completed!")
	else:
		print("No changes applied.")