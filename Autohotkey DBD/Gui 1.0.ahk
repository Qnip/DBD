#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

#NoTrayIcon
DetectHiddenWindows, On 

;#################################################################
;########################## VARIABLES ############################
;#################################################################

Global TitleText := "None"
Global ScriptName := "0"

;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Start:
gui, color, Black
gui, font, cLime s15, Comic Sans MS
gui, add, text, x18 y15, Active Script = %TitleText%
gui, add, text, x18 y15, Active Script = %TitleText%
gui, font,

;#################################################################
;########################## Buttons ##############################
;#################################################################

gui, add, button, x20 y70 w220 h30 gSurvivor, Survivor

gui, add, button, x20 y120 w220 h30 gKiller, Killer

gui, add, button, x20 y170 w220 h30 gHag, Hag

gui, add, button, x20 y220 w220 h30 gClown, Clown

;-----------------------------------------------------------------

gui, add, button, x82 y400 w100 h30 gRestart, Reload

gui, add, button, x82 y450 w100 h30 gQuit, Quit

Gui, Show, w260 h500, HotkeyScripts
Return

;#################################################################
;########################## Functions ############################
;#################################################################

Survivor:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	Global TitleText := "Survivor       "
	Global ScriptName := "Survivor"
	Run %A_ScriptDir%\%ScriptName%.ahk
	gosub Start
	Return
	
Killer:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	Global TitleText := "Killer          "
	Global ScriptName := "Killer"
	Run %A_ScriptDir%\%ScriptName%.ahk
	gosub Start
	Return

Hag:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	Global TitleText := "Hag         "
	Global ScriptName := "Hag"
	Run %A_ScriptDir%\%ScriptName%.ahk
	gosub Start
	Return

Clown:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	Global TitleText := "Clown        "
	Global ScriptName := "Clown"
	Run %A_ScriptDir%\%ScriptName%.ahk
	gosub Start
	Return


;-------------------------------------------------------------------

Restart:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	Reload

Quit:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	ExitApp
	
GuiClose:
	WinClose, %A_ScriptDir%\%ScriptName%.ahk
	ExitApp

^Esc::
	ExitApp