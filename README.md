<h1>Godot Bulk Group Assigner</h1>

<p>This is a Godot Engine template project which contains the 'group_assigner' scene which has a script with the same name attached. The scene can be used to execute the script which assigns or unassigns a group to or from any nodes that match the 
supplied nodePrefix string in the chosen scene.</p>

<h2>Why would you need this?</h2>
<p>Currently it is not possible to assign multiple nodes to a group simultaneously within the editor in the latest version of Godot Engine. This means that when you want to assign several nodes to a group, you have to assign them all one at a time, 
  which can be frustratingly slow. This script solves that problem by allowing you to assign all nodes with a given name prefix to a group all at once simply by setting the parameters and executing the script.
</p>

<h2>How it works</h2>
<p>The script reads a given tscn scene file and then rewrites it to a new tscn file which will have the specified group assigment applied. Check the new tscn file by attempting to open it in the editor, if it opens and your nodes have been assigned as you expected,
then it is safe to overwrite your original scene with the new one (just rename the file to the original file name to overwrite it).
<br><br>
The reason for writing to a new file is that there is potential for this script to corrupt your scene if not used carefully, and since a lot of people don't use source control (please use source control!) I didn't want to risk allowing them to 
break their projects with my script. It's a bit of a hacky solution, but it solves the problem of not being able to assign multiple nodes to a group at once.
<br><br>
If you are using source control and are comfortable with potentially applying breaking changed to your scene file, feel free to alter the script so that it writes directly to the original file, that's how I use it in my projects.</p>

<h2>How to run the script</h2>
<p>The script takes in 4 parameters which can be set in the editor in 'group_assigner' scene. Set these parameters as desired and then run the script by setting 'Run Processing' to on, the script will run immediately. You can check the output panel to see which nodes
are updated.</p>

<h2>Script Parameters</h2>
<h3>sceneFile</h3> 
<p>The scene that contains the nodes you want to assign / unassign to / from a group.</p>

<h3>nodePrefix</h3> 
<p>This is the prefix for the nodes you want to assign to the group, so for example if you have 10 enemy nodes in your scene named like 'enemy1, enemy2, enemy3, etc.' then set nodePrefix to 'enemy'.</p>

<h3>groupName</h3> 
<p>This is the name of the group you want to assign / unassign. Bare in mind you have to create the group yourself first.</p>

<h3>operationMode</h3> 
<p>Set this to 0 to assign nodes to a group, or 1 to unassign them.</p>

<h2>How to add this to your project</h2>
<p>Just copy the 'group_assigner' scene to wherever you keep your scenes, and the 'group_assigner' script to wherever you keep your scripts. Open the 'group_assigner' scene in your project, and fix the dependencies by setting the correct path to your 
'group_assigner' script. Now the scene is ready to use in your project.</p>
