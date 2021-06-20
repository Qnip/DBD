#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

#IfWinActive

<+Escape::
ExitApp

<+|::
Suspend On
KeyWait, |, D T120
Suspend Off
Return

#IfWinActive ahk_exe DeadByDaylight-Win64-Shipping.exe 

;#################################################################
;########################## VARIABLES ############################
;#################################################################

global ExitVar := 0
;~ global Switch := 0


;#################################################################
;########################## FUNCTIONS ############################
;#################################################################

;~ BreakLoopKey()
;~ {
	;~ return GetKeyState("W") or GetKeyState("A") or GetKeyState("S") or GetKeyState("D") or GetKeyState("LCtrl")
;~ }

;~ BreakLoopMouse()
;~ {
	;~ return GetKeyState("LButton") or GetKeyState("RButton")
;~ }

SleepLoopA(A:=5, B:=30, C:="0", D:="0", E:="0", F:="0", G:="0")
{
	Global ExitVar := 0
	Loop %A%
	{
		If (GetKeyState("W"))
		{ 
			SendInput, {%C% up}
			SendInput, {%D% up}
			SendInput, {%E% up}
			SendInput, {%F% up}
			SendInput, {%G% up}
			Return global ExitVar := 1
		} 
		Else
		{
			Sleep, %B%
		}	
	}
}

SleepLoopB(A:=5, B:=30, C:="0", D:="0", E:="0", F:="0", G:="0")
{
	Global ExitVar := 0
	Loop %A%
	{
		If (GetKeyState("XButton1"))
		{ 
			SendInput, {%C% up}
			SendInput, {%D% up}
			SendInput, {%E% up}
			SendInput, {%F% up}
			SendInput, {%G% up}
			Return global ExitVar := 1
		} 
		Else
		{
			Sleep, %B%
		}	
	}
}

;#################################################################
;########################## HOTKEYS ##############################
;#################################################################

WheelDown::
	ExitVar := 0
	SendInput {F6 down}
	While (!ExitVar)
	{
		SleepLoopA(3, 30, "F6")
	}
	Return

;~ 4::
	;~ SendInput {F6 Down}
	;~ While (1)
	;~ {
		;~ SendInput {F10}
		;~ SleepLoopB(9, "F6")
		;~ If (ExitVar = 1)
		;~ {
			;~ Exit
		;~ }
	;~ }

XButton2::
	ExitVar := 0
	While (!ExitVar)
	{
		SendInput {F10 down}
		SleepLoopB(2, 50, "F10", "F6")
		SendInput {F10 up}
		sleep, 5
	}
	Return