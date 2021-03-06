; --------------------------------------------------------------
; OS X Like system shortcuts
; Ref: https://github.com/stroebjo/autohotkey-windows-mac-keyboard/blob/master/MacKeyboard.ahk
; --------------------------------------------------------------

; Make Alt key in windows keyboard as command key.

; Make Ctrl + S work with ALT key
!s::Send ^s

; Selecting
!a::Send ^a

; Copying
!c::Send ^c

; Pasting
!v::Send ^v

; Cutting
!x::Send ^x

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