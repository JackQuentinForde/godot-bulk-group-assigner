@tool
extends Node

@export_file("*tscn") var sceneFile : String
@export var nodePrefix : String = ""
@export var groupName : String = ""
@export var operationMode : int = 0 ## 0 to assign nodes to group, 1 to remove nodes from group
@export var runProcessing : bool = false : set = setRunProcessing

func setRunProcessing(value : bool) -> void:
	if value == true:
		runProcessing = false
		var fullNodePrefix = "[node name=\"" + nodePrefix
		processFile(fullNodePrefix)

func processFile(prefix : String) -> void:
	if FileAccess.file_exists(sceneFile):
		var readFile = FileAccess.open(sceneFile, FileAccess.READ)
		var content = readFile.get_as_text()
		readFile.close()

		var lines = content.split("\n")
		var groupPart = " groups=[\"" + groupName + "\"]"

		var changesPending = false

		for i in range(lines.size()):
			var line = lines[i]

			var groupAssignmentCondition = not line.contains(groupPart) if operationMode == 0 else line.contains(groupPart)

			if line.begins_with(prefix) and groupAssignmentCondition:
				var newLine = line.rstrip("] ") + groupPart + "]" if operationMode == 0 else line.replace(groupPart, "")
				lines[i] = newLine
				changesPending = true
				print("Changing " + line + " to " + newLine)

		if changesPending:
			var newContent = "\n".join(lines)
			var writeFile = FileAccess.open(sceneFile, FileAccess.WRITE)
			writeFile.store_string(newContent)
			writeFile.close()
			print("Group assignment completed!")
	else :
		push_error("Scene file not found: %s" % sceneFile)
		return