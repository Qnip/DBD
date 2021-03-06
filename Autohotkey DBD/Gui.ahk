#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

#NoTrayIcon
DetectHiddenWindows, On 

;#################################################################
;########################## VARIABLES ############################
;#################################################################

ScriptName := "None"

NameArray := ["Survivor", "Killer", "Hag", "Clown"]



;!!!!!!!!!!!!!!!!!!!!!!!!! Close existing !!!!!!!!!!!!!!!!!!!!!!!!

CloseScripts(NameArray)

;!!!!!!!!!!!!!!!!!!!!!!!!!		Start 	  !!!!!!!!!!!!!!!!!!!!!!!!

Start:
gui, color, Black
gui, font, cLime s15, Comic Sans MS
gui, add, text, x18 y15, Active Script = %ScriptName%             .
gui, add, text, x18 y15, Active Script = %ScriptName%             .
gui, font,

;#################################################################
;########################## Buttons ##############################
;#################################################################

i := 1
while (i <= NameArray.MaxIndex())
{
	ButtonNameG := "g" . NameArray[i]
	ButtonName := NameArray[i]
	ButtonPosY := "y" . i*50 + 20
	gui, add, button, x20 %ButtonPosY% w220 h30 %ButtonNameG%, %ButtonName%
	i++
}

;-----------------------------------------------------------------

gui, add, button, x82 y400 w100 h30 gRestart, Reload

gui, add, button, x82 y450 w100 h30 gQuit, Quit

Gui, Show, w260 h500, HotkeyScripts
Return

;#################################################################
;########################## Functions ############################
;#################################################################

CloseScripts(NameArray)
{
	i := 1
	while (i <= NameArray.MaxIndex())
	{
		ScriptName := NameArray[i]
		WinClose, %A_ScriptDir%\%ScriptName%.ahk
		i++
	}
}

;#################################################################
;########################## Subroutines ##########################
;#################################################################


Survivor:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	ScriptName := "Survivor"
	Run %A_ScriptDir%\%ScriptName%.ahk
	gosub Start
	Return
	
Killer:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	ScriptName := "Killer"
	Run %A_ScriptDir%\%ScriptName%.ahk
	gosub Start
	Return

Hag:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	ScriptName := "Hag"
	Run %A_ScriptDir%\%ScriptName%.ahk
	gosub Start
	Return

Clown:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	ScriptName := "Clown"
	Run %A_ScriptDir%\%ScriptName%.ahk
	gosub Start
	Return


;-------------------------------------------------------------------

Restart:
	CloseScripts(NameArray)
	Reload

Quit:
	CloseScripts(NameArray)
	ExitApp
	
GuiClose:
	CloseScripts(NameArray)
	ExitApp

^Esc::
	CloseScripts(NameArray)
	ExitApp
