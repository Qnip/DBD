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
global Switch := 0


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

SleepLoopA(A:=5, B:="0", C:="0", D:="0", E:="0", F:="0", G:="0")
{
	Global ExitVar := 0
	Loop %A%
	{
		If (GetKeyState("W"))
		{ 
			SendInput, {%B% up}
			SendInput, {%C% up}
			SendInput, {%D% up}
			SendInput, {%E% up}
			SendInput, {%F% up}
			SendInput, {%G% up}
			Return global ExitVar := 1
		} 
		Else
		{
			Sleep, 30
		}	
	}
}

SleepLoopB(A:=5, B:="0", C:="0", D:="0", E:="0", F:="0", G:="0")
{
	Global ExitVar := 0
	Loop %A%
	{
		If (GetKeyState("W"))
		{ 
			SendInput, {%B% up}
			SendInput, {%C% up}
			SendInput, {%D% up}
			SendInput, {%E% up}
			SendInput, {%F% up}
			SendInput, {%G% up}
			Return global ExitVar := 1
		} 
		Else
		{
			Sleep, 59
		}	
	}
}

SleepLoopC(A:=5, B:="0", C:="0", D:="0", E:="0", F:="0", G:="0")
{
	Global ExitVar := 0
	Loop %A%
	{
		If (GetKeyState("W"))
		{ 
			SendInput, {%B% up}
			SendInput, {%C% up}
			SendInput, {%D% up}
			SendInput, {%E% up}
			SendInput, {%F% up}
			SendInput, {%G% up}
			Return global ExitVar := 1
		} 
		Else
		{
			Sleep, 30
		}	
	}
}

;#################################################################
;########################## HOTKEYS ##############################
;#################################################################

XButton1::
	SendInput {F6 down}
	While (1)
	{
		SendInput {F10}
		SleepLoopB(8, "F6")
		If (ExitVar = 1)
		{
			Exit
		}
	}
	

WheelDown::
	SendInput {F6 down}
	While (1)
	{
		SleepLoopA(3, "F6")
		If (ExitVar = 1)
		{
			Exit
		}
	}

LControl::
	SendInput, {F9 down}
	KeyWait, LShift, D T3.5
	SendInput, {F9 Up}
	Return
