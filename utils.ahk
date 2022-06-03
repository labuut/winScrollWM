#SingleInstance, Force

global monitorsCount := 0

getMonitorsCount() {
  SysGet, OutputVar, MonitorCount
  
  monitorsCount := OutputVar

  ; MsgBox,,, OutputVar: %OutputVar%,  
  return
}

; from 1 index
getMonitorWorkAreaSize(monNum) {
  SysGet, Size, MonitorWorkArea , %monNum%

  height := Abs(SizeTop + SizeBottom)
  width := Abs(SizeLeft + SizeRight)

  ; MsgBox, height: %height%, width: %width%
  return {height: height, width: width}
}

; TODO: use current monitor to define steps
; TODO: use current X/Y of window with specified winTitle
moveWindow(winTitle, targetX, targetY, isSmooth) {
  ; SetWinDelay % 1000//24
	SetWinDelay 10

  WinGetPos, currentX, currentY,,, %winTitle%

  ; MsgBox,,, winTitle: %winTitle% | targetX: %targetX% | targetY: %targetY% | isSmooth: %isSmooth% | currentX: %currentX% | currentY: %currentY%,
  
 	xStep := 96 ; TODO: replace by calculated value
  yStep := 54 ; TODO: replace by calculated value

	nextX := isSmooth ? currentX : targetX ; TODO: replace by calculated value
  nextY := isSmooth ? currentY : targetY  ; TODO: replace by calculated value

	while (nextX != targetX) || (nextY != targetY) {
    ; MsgBox,,, __1: nextX: %nextX% | nextY: %nextY%
		; WinMove, WinTitle, WinText, X, Y, W, H, ExcludeTitle, ExcludeText
		WinMove, %winTitle%, , %nextX%, %nextY%

    newX := targetX > currentX
      ? nextX + xStep
      : nextX - xStep
    newY := targetY > currentY
      ? nextY + yStep
      : nextY - yStep
    
    if (targetX > currentX) {
      nextX := newX >= targetX ? targetX : newX 
    } else {
      nextX := newX <= targetX ? targetX : newX 
    }

    if (targetY > currentY) {
      nextY := newY >= targetY ? targetY : newY 
    } else {
      nextY := newY <= targetY ? targetY : newY 
    }
  }
  
  ; MsgBox,,, __2: nextX: %nextX% | nextY: %nextY%

  ; the last move
  WinMove, %winId%, , %nextX%, %nextY%

  return
}

; ; TODO: use current height/width of window with specified winTitle
; ; TODO: use current monitor to define steps
; resizeWindow(winTitle, height, width, isSmoothX, isSmoothY) {
;   ; SetWinDelay % 1000//24
; 	SetWinDelay 10
  
;  	widthStep := 100
;   heightStep := 20

; 	currentWidth := 0
;   currentHeight := 0

;   finalWidth := isSmoothX ? currentWidth : width
;   finalHeight := isSmoothY ? currentHeight : height

; 	while current < target {
; 		; WinMove, WinTitle, WinText, X, Y , Width, Height, ExcludeTitle, ExcludeText
; 		; WinMove, %ActiveWindowTitle%, , 0, 0, 700, 900

; 		WinMove, %winId%, , %x%, %y%, %finalWidth%, %finalHeight%

;     nextWidth := currentWidth <= width 
;       ? currentWidth + widthStep 
;       : width

;     nextHeight := currentHeight <= height
;       ? currentHeight + heightStep 
;       : height

;     currentWidth := nextWidth
;     currentHeight := nextHeight
;   }
; }