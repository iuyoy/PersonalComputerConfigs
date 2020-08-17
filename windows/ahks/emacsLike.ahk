;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;; The origin script is from https://github.com/usi3/emacs.ahk
;; But I change Ctrl or alt to CapsLock
;;
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; turns to be 1 when ctrl-x is pressed
is_pre_x = 0
; turns to be 1 when ctrl-space is pressed
is_pre_spc = 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
;   IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
;     Return 1 
;   IfWinActive,ahk_class MEADOW ; Meadow
;     Return 1 
;   IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
;     Return 1
;   IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
;     Return 1
;   ; Avoid VMwareUnity with AutoHotkey
;   IfWinActive,ahk_class VMwareUnityHostWndClass
;     Return 1
;   IfWinActive,ahk_class Vim ; GVIM
;     Return 1
;  IfWinActive,ahk_class SWT_Window0 ; Eclipse
;    Return 1
;   IfWinActive,ahk_class Xming X
;     Return 1
;   IfWinActive,ahk_class SunAwtFrame
;     Return 1
;   IfWinActive,ahk_class Emacs ; NTEmacs
;     Return 1  
;   IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
;     Return 1
  Return 0
}

delete_char()
{
  Send {Del}
  global is_pre_spc = 0
  Return
}
delete_backward_char()
{
  Send {BS}
  global is_pre_spc = 0
  Return
}
kill_line()
{
  Send {ShiftDown}{END}{SHIFTUP}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  global is_pre_spc = 0
  Return
}
open_line()
{
  Send {END}{Enter}{Up}
  global is_pre_spc = 0
  Return
}
quit()
{
  Send {ESC}
  global is_pre_spc = 0
  Return
}
newline()
{
  Send {Enter}
  global is_pre_spc = 0
  Return
}
indent_for_tab_command()
{
  Send {Tab}
  global is_pre_spc = 0
  Return
}
newline_and_indent()
{
  Send {Enter}{Tab}
  global is_pre_spc = 0
  Return
}
isearch_forward()
{
  Send ^f
  global is_pre_spc = 0
  Return
}
isearch_backward()
{
  Send ^f
  global is_pre_spc = 0
  Return
}
kill_region()
{
  Send ^x
  global is_pre_spc = 0
  Return
}
kill_ring_save()
{
  Send ^c
  global is_pre_spc = 0
  Return
}
yank()
{
  Send ^v
  global is_pre_spc = 0
  Return
}
undo()
{
  Send ^z
  global is_pre_spc = 0
  Return
}
find_file()
{
  Send ^o
  global is_pre_x = 0
  Return
}
save_buffer()
{
  Send, ^s
  global is_pre_x = 0
  Return
}
kill_emacs()
{
  Send !{F4}
  global is_pre_x = 0
  Return
}

move_beginning_of_line()
{
  global
  if is_pre_spc
    Send +{HOME}
  Else
    Send {HOME}
  Return
}
move_end_of_line()
{
  global
  if is_pre_spc
    Send +{END}
  Else
    Send {END}
  Return
}
previous_line()
{
  global
  if is_pre_spc
    Send +{Up}
  Else
    Send {Up}
  Return
}
next_line()
{
  global
  if is_pre_spc
    Send +{Down}
  Else
    Send {Down}
  Return
}
forward_char()
{
  global
  if is_pre_spc
    Send +{Right}
  Else
    Send {Right}
  Return
}
backward_char()
{
  global
  if is_pre_spc
    Send +{Left} 
  Else
    Send {Left}
  Return
}
scroll_up()
{
  global
  if is_pre_spc
    Send +{PgUp}
  Else
    Send {PgUp}
  Return
}
scroll_down()
{
  global
  if is_pre_spc
    Send +{PgDn}
  Else
    Send {PgDn}
  Return
}


CapsLock & x::
  If is_target()
    Send %A_ThisHotkey%
  Else
    is_pre_x = 1
  Return 
CapsLock & f::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_x
      find_file()
    Else
      forward_char()
  }
  Return  
CapsLock & c::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_x
      kill_emacs()
  }
  Return  
CapsLock & d::
  If is_target()
    Send %A_ThisHotkey%
  Else
    delete_char()
  Return
CapsLock & h::
  If is_target()
    Send %A_ThisHotkey%
  Else
    delete_backward_char()
  Return
CapsLock & k::
  If is_target()
    Send %A_ThisHotkey%
  Else
    kill_line()
  Return
;; ^o::
;;   If is_target()
;;     Send %A_ThisHotkey%
;;   Else
;;     open_line()
;;   Return
CapsLock & g::
  If is_target()
    Send %A_ThisHotkey%
  Else
    quit()
  Return
;; ^j::
;;   If is_target()
;;     Send %A_ThisHotkey%
;;   Else
;;     newline_and_indent()
;;   Return
CapsLock & m::
  If is_target()
    Send %A_ThisHotkey%
  Else
    newline()
  Return
CapsLock & i::
  If is_target()
    Send %A_ThisHotkey%
  Else
    indent_for_tab_command()
  Return
CapsLock & s::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_x
      save_buffer()
    Else
      isearch_forward()
  }
  Return
CapsLock & r::
  If is_target()
    Send %A_ThisHotkey%
  Else
    isearch_backward()
  Return
CapsLock & w::
  If is_target()
    Send %A_ThisHotkey%
  Else
    If GetKeyState("Shift", "P")
        kill_ring_save()
    Else 
        kill_region()
    Return
  Return
; !w::
;   If is_target()
;     Send %A_ThisHotkey%
;   Else
;     kill_ring_save()
;   Return
CapsLock & y::
  If is_target()
    Send %A_ThisHotkey%
  Else
    yank()
  Return
CapsLock & /::
  If is_target()
    Send %A_ThisHotkey%
  Else
    undo()
  Return  
  
;$^{Space}::
;^vk20sc039::
CapsLock & vk20::
  If is_target()
    Send {CtrlDown}{Space}{CtrlUp}
  Else
  {
    If is_pre_spc
      is_pre_spc = 0
    Else
      is_pre_spc = 1
  }
  Return
CapsLock & @::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_spc
      is_pre_spc = 0
    Else
      is_pre_spc = 1
  }
  Return
CapsLock & a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_beginning_of_line()
  Return
CapsLock & e::
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_end_of_line()
  Return
CapsLock & p::
  If is_target()
    Send %A_ThisHotkey%
  Else
    previous_line()
  Return
CapsLock & n::
  If is_target()
    Send %A_ThisHotkey%
  Else
    next_line()
  Return
CapsLock & b::
  If is_target()
    Send %A_ThisHotkey%
  Else
    backward_char()
  Return
CapsLock & v::
  If is_target()
    Send %A_ThisHotkey%
  Else
    scroll_down()
  Return
; !v::
CapsLock & u::
  If is_target()
    Send %A_ThisHotkey%
  Else
    scroll_up()
  Return