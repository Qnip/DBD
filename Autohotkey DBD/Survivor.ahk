#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode Input
#SingleInstance Force

#IfWinActive

<+Escape::
ExitApp
Return

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

;#################################################################
;########################## FUNCTIONS ############################
;#################################################################

BreakLoopKey()
{
	return GetKeyState("W") or GetKeyState("A") or GetKeyState("S") or GetKeyState("D") or GetKeyState("LShift") or GetKeyState("LCtrl")
}

BreakLoopMouse()
{
	return GetKeyState("LButton") or GetKeyState("RButton")
}

;-----------------------------------------------------------------

SleepLoopA(A:=5, B:="0", C:="0", D:="0", E:="0", F:="0", G:="0")
{
	Global ExitVar := 0
	Loop %A%
	{
		If (BreakLoopKey() or BreakLoopMouse())
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
			Sleep, 10
		}	
	}
}

SleepLoopB(A:=5, B:="0", C:="0", D:="0", E:="0", F:="0", G:="0")
{
	Global ExitVar := 0
	Loop %A%
	{
		If (BreakLoopMouse() or GetKeyState("W"))
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
			Sleep, 10
		}	
	}
}

SleepLoopC(A:=2, B:="0", C:="0", D:="0", E:="0", F:="0", G:="0")
{
	Global ExitVar := 0
	Loop %A%
	{
		If (BreakLoopMouse())
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
			Sleep, 50
		}	
	}
}

SleepLoopD(A:=2, B:="0", C:="0", D:="0", E:="0", F:="0", G:="0")
{
	Global ExitVar := 0
	Loop %A%
	{
		If (BreakLoopMouse())
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
			Sleep, 115
		}	
	}
}

;#################################################################
;########################## HOTKEYS ##############################
;#################################################################

F1::
	SendInput, {F6 down}
	SendInput, {F7 down}
	SendInput, {F8 down}
	While (1)
	{
		SleepLoopB(5, "F3", "F4", "F5", "F6", "F7", "F8")
		If (ExitVar = 1)
		{
			Exit
		}
	}
	
;-----------------------------------------------------------------

XButton1::
	While (1)
	{
		SendInput, {F8 down}
		SleepLoopA(5, "F3", "F4", "F5", "F6", "F7", "F8")
		If (ExitVar = 1)
		{
			Exit
		}
	}

;-----------------------------------------------------------------

WheelDown::
	SendInput, {F6 down}
	SendInput, {F7 down}
	While (1)
	{
		SleepLoopB(5, "F3", "F4", "F5", "F6", "F7", "F8")
		If (ExitVar = 1)
		{
			Exit
		}
	}
	
;-----------------------------------------------------------------

WheelUp::
	While (1) 
	{ 
		SendInput, {F5 down}
		SleepLoopA(5, "F3", "F4", "F5", "F6", "F7", "F8")
		If (ExitVar = 1)
		{
			exit
		}
		SendInput, {F5 up}
		SendInput, {F4 down}
		SleepLoopA(5, "F3", "F4", "F5", "F6", "F7", "F8")
		If (ExitVar = 1)
		{
			exit
		}
		SendInput, {F4 up}
	}	
	
;-----------------------------------------------------------------
	
;~ 4::
	;~ While (1)
	;~ { 
		;~ SendInput, {F3 down}
		;~ SleepLoopC(2, "F3", "F4", "F5", "F6", "F7", "F8")
		;~ If (ExitVar = 1)
		;~ {
			;~ exit
		;~ }
		;~ SendInput, {F3 up}
		;~ SleepLoopC(2, "F3", "F4", "F5", "F6", "F7", "F8")
		;~ If (ExitVar = 1)
		;~ {
			;~ exit
		;~ }
	;~ }
	
;~ ;-----------------------------------------------------------------
	
;~ 3::
	;~ SendInput, {F7 down}
	;~ SendInput, {F6 down}
	;~ While (1)
	;~ {
		;~ SendInput, {F5 down}
		;~ SleepLoopD(1, "F3", "F4", "F5", "F6", "F7", "F8")
		;~ If (ExitVar = 1)
		;~ {
			;~ exit
		;~ }
		;~ SendInput, {F5 Up}
		;~ SendInput, {F4 down}
		;~ SleepLoopD(1, "F3", "F4", "F5", "F6", "F7", "F8")
		;~ If (ExitVar = 1)
		;~ {
			;~ exit
		;~ }
		;~ SendInput, {F4 up}
	;~ }
	
;~ ;-----------------------------------------------------------------

;~ 2::
	;~ Loop 40
	;~ {
		;~ SendInput {RButton down} 
		;~ sleep 12
		;~ SendInput {RButton up} 
		;~ sleep 5
	;~ }

;~ 1::
	;~ Loop 10
	;~ {
		;~ SendInput {F8 down}
		;~ sleep 50
		;~ SendInput {F8 up}
		;~ sleep 50
	;~ }