My Shutdown
Easily create a custom shutdown script. It's made with computer novices in mind without sacrificing usability.

To make your own script:
* Make a new text document inside the scripts folder. Name it whatever you want.
* Write the script. See below for how to write a script.

How to Write a Script:
In this section you will learn how to write your own script. It's very simple, so don't be scared. :)

In a script file you will mostly use the RUN command. The syntax for a run command is as follows.
RUN		C:\Path To\SomeProgram\executable.exe		/parameters

As you can see from the above example, it's COMMAND EXECUTABLE PARAMETERS. Notice also that the command uses TABs to separate the values.
Making sure to use tabs, at least one, between each value is very important. Tabs also make it more human readable.
Take a look at the example.txt file in the scripts folder. You can also run it to test it out.

A Full List of Commands and Their Syntax: (all options are optional | <> indicate a required field, [] indicate an optional field. | Do not type the <>[] characters!)
RUN			<EXE>	[PARAMETERS]
MESSAGE		<Type your message.>
WAIT		<EXE>

A good way to run this script is to make a shortcut to it on your desktop, or put it in the group policy shutdown scripts. If you use a shurtcut, you should edit the target box of the shortcut to include the name of your script file at the end with a space separating it from the rest of the text there, and then you should set the shortcut to run as admin bu clicking Advanced on the General tab.