; Iuyyoy AutoHotKey Script
; Ref: https://github.com/stroebjo/autohotkey-windows-mac-keyboard/blob/master/MacKeyboard.ahk
; 
; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
;


;; when using mac to connect windows vm sometimes
!^Left::Send #^{Left}
!^Right::Send #^{Right}

; !1::Run http://www.google.com 


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


CapsLock & u::Send {PgUp}
; VScode
; go to line
CapsLock & g::Send ^g
; go to symbol
CapsLock & r::Send ^r
; delete line
CapsLock & d::Send ^+k
; go to start
CapsLock & a::Send {Home}
; go to end
CapsLock & e::Send {End}


; --------------------------------------------------------------
; OS X Like system shortcuts
; --------------------------------------------------------------

; Make Ctrl + S work with ALT key
!s::Send, ^s

; Selecting
!a::Send, ^a

; Copying
!c::Send, ^c

; Pasting
!v::Send, ^v

; Cutting
!x::Send, ^x

; Opening
!o::Send ^o

; Finding
!f::Send ^f

; Undo
!z::Send ^z

; Redo
!y::Send ^y

; New tab
!t::Send ^t

; Reopen last closed tab
!+t::Send ^+t

; Refresh
!r::Send ^r

; close tab
!w::Send ^w

; Close windows (cmd + q to Alt + F4)
!q::Send !{F4}

; minimize windows
!m::WinMinimize,a

; New window
!n::Send ^n

; New advanced window
!+n::Send ^+n

; New window
!p::Send ^p

; New window
!+p::Send ^+p

; Comment
!/::Send ^/

; Alt + Left Mounse Click => Ctrl + Click
!LButton::Send ^{Click}