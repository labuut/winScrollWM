#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; https://www.makeuseof.com/windows-autohotkey-center-window/
; ^y::
; 	WinGetTitle, ActiveWindowTitle, A ; Get the active window's title for "targetting" it/acting on it.
; 	WinGetPos,,, Width, Height, %ActiveWindowTitle% ; Get the active window's position, used for our calculations.
; 	TargetX := (A_ScreenWidth/2)-(Width/2) ; Calculate the horizontal target where we'll move the window.
; 	TargetY := (A_ScreenHeight/2)-(Height/2) ; Calculate the vertical placement of the window.
	
; 	WinMove, %ActiveWindowTitle%,, %TargetX%, %TargetY% ; Move the window to the calculated coordinates.
	
; return

; move smoothly https://www.autohotkey.com/board/topic/13597-resize-a-window-using-winmove/
; WinTitle := "AutoHotkey Help" ; Make sure AutoHotkey CHM help is running
; WinActivate, %WinTitle%

; WinMove, %WinTitle%, , 0, 0 , 300, 300 ; This is what you asked for!

; Ctr = 0
; Loop 50 {
;   WinMove, %WinTitle%, , %Ctr% , , 300, 300
;   Ctr += 5
; }


; Ctr = 0
; Loop 50 {
;   WinMove, %WinTitle%, , , %Ctr% , 300, 300
;   Ctr += 5
; }


; 	WinGetTitle, ActiveWindowTitle, A ; Get the active window's title for "targetting" it/acting on it.
; 	WinGetPos,,, Width, Height, %ActiveWindowTitle% ; Get the active window's position, used for our calculations.
; 	TargetX := (A_ScreenWidth/2)-(Width/2) ; Calculate the horizontal target where we'll move the window.
; 	TargetY := (A_ScreenHeight/2)-(Height/2) ; Calculate the vertical placement of the window.

; 	; SetWinDelay % 1000//24
; 	SetWinDelay 10
; 	; WinMove, %ActiveWindowTitle%, , 0, 0, 400, 900

; 	step := 100
; 	target := 1400
; 	current := 0
; 	while current < target {
; 		; WinMove, WinTitle, WinText, X, Y , Width, Height, ExcludeTitle, ExcludeText
; 		WinMove, %ActiveWindowTitle%, , 0, 0, current, 900
; 		; WinMove, %ActiveWindowTitle%, , 0, 0, 700, 900
; 		current := current + step
;   }

	
; return