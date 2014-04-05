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

Important, you must add #SCRIPT START# to the top of your script for it to be recognized as a script. Also, make sure your text editor isn't changing tabs to spaces. If it does, it will ruin your script. Notepad should work fine. I suggest Notepad++ though, then you can view the tabs as symbols.

A good working example of a script that's actually useful is my own script. Take a look below. I just run it any time I'm shutting down for a while, not a reboot.
---- ---- ---- ---- ---- ----
#SCRIPT START#
; This is a comment line.
; Use TABS to separate values!
; Drive and path are not required if the executable is in your path variable.

message	CCleaner...
run		C:\Program Files\CCleaner\CCleaner.exe	/AUTO
wait	CCleaner64.exe

message	Wise Registry Cleaner...
run		C:\Program Files (x86)\Wise\Wise Registry Cleaner\WiseRegCleaner.exe	-a
wait	WiseRegCleaner.exe

message	Ultra Defrag...
run		udefrag		--defragment -m C: F:
run		udefrag		--defragment -m D:
run		udefrag		--defragment -m E:
wait	udefrag.exe

message	Shutting down...
run		shutdown	-s -t 0
---- ---- ---- ---- ---- ----
