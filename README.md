<h1>Godot Bulk Group Assigner</h1>

<p>This is a Godot Engine template project which contains the 'group_assigner' scene which has a script with the same name attached. The scene can be used to execute the script which assigns groups to any nodes in the specified scene that match the 
supplied nodePrefix string.</p>

<h2>Why would you need this?</h2>
<p>Currently it is not possible to assign multiple nodes to a group simultaneously within the editor in the latest version of Godot Engine. This means that when you want to assign several nodes to a group, you have to assign them all one at a time, 
which can be frustratingly slow. This script solves that problem by allowing you to assign all nodes with a given name prefix to a group, or groups all at once simply by setting the parameters and executing the script. You can also remove nodes from
all groups by simply not supplying any groups and executing the script.</p>

<h2>How to add this to your project</h2>
<p>Just copy the 'group_assigner' scene to wherever you keep your scenes, and the 'group_assigner' script to wherever you keep your scripts. Open the 'group_assigner' scene in your project, and fix the dependencies by setting the correct path to your 
'group_assigner' script. Now the scene is ready to use in your project.</p>

<h2>How it works</h2>
<p>The script reads a given tscn scene file and then either overwrites it, or writes to a new tscn file, with the specified groups applied to the relevant nodes. If not using source control, it is highly recommended to write to a new file first, and then
only overwrite after checking that the modified scene file is working. Check the new tscn file by attempting to open it in the editor, if it opens and your nodes have been assigned as you expected, then it is safe to overwrite your original scene with the new one.
Please be extremely careful with this, if you use this script in overwrite mode and end up breaking your project, don't say I din't warn you.
<br><br>
It's a bit of a hacky solution, but it solves the problem of not being able to assign multiple nodes to a group at once.

<h2>How to run the script</h2>
<p>The script takes in 4 parameters which can be set in the editor in the 'group_assigner' scene. Set these parameters as desired and then run the script by setting 'Run Processing' to on, the script will run immediately. You can check the output panel to see which nodes
are updated.</p>

<h2>Script Parameters</h2>
<h3>sceneFile</h3> 
<p>The scene that contains the nodes you want to assign / unassign to / from a group.</p>

<h3>nodePrefix</h3> 
<p>This is the prefix for the nodes you want to assign to the group, so for example if you have 10 enemy nodes in your scene named like 'enemy1, enemy2, enemy3, etc.' then set nodePrefix to 'enemy'.</p>

<h3>groups</h3> 
<p>These are the names of the groups you want to assign. Be aware that this will ignore all previous group assignemnts for the relevant nodes. Also bare in mind you have to create the groups in the editor first. If not groups are supplied, this has the effect
of removing all group assignments from the relevant nodes.</p>

<h3>overwriteScene</h3> 
<p>When set to true this will overwrite the existing scene rather than saving to a new one. It is set to false by default, again, be very careful when setting it to true.</p>
