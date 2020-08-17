; Iuyyoy AutoHotKey Script
; 
; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN


;;; Transfer CapsLock to Function key

;  CapsLock processing.  Must double tap CapsLock to toggle CapsLock mode on or off.
CapsLock::
KeyWait, CapsLock ; Wait forever until Capslock is released.
KeyWait, CapsLock, D T0.2 ; ErrorLevel = 1 if CapsLock not down within 0.2 seconds.
if ((ErrorLevel = 0) && (A_PriorKey = "CapsLock") ) ; Is a double tap on CapsLock?
{
SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On" ; Toggle the state of CapsLock LED
} else {
;switch mode of input method
Send {LShift}
}
return

;;; Load emacs like script and use CapsLock as Ctrl in emacsLike script
#Include %A_ScriptDir%\emacsLike.ahk

;;; Load MacOS X Like shortcuts
#Include %A_ScriptDir%\MacOSXLikeKeyMap.ahk


;;; Other configs

; Remap virtual desktop moving shotcuts especially when using mac to connect windows vm
!^Left::Send #^{Left}
!^Right::Send #^{Right}

; Alt + Left Click => Ctrl + Click
!LButton::Send ^{Click}