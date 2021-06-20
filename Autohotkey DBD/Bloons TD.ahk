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

#IfWinActive ahk_exe BloonsTD6.exe



XButton2::
ExitVar := 0
input, AbilityVar, L1, XButton1
While (!ExitVar) {
	SendInput, %AbilityVar%
	{
		If (GetKeyState("XButton1"))
		{ 
			ExitVar := 1
		} 
		Else
		{
			Sleep, 100
		}	
	}
}