; =============================================================================
;  Module: Win / Cmd  →  Mac-style shortcuts
; -----------------------------------------------------------------------------
;  On a Mac keyboard the physical ⌘ Command key is seen by Windows as the
;  Windows key. Hold it and you get the macOS equivalents of the most common
;  shortcuts. Everything here is gated by EnableWinToCommand (config/settings.ahk).
;
;  Shortcuts we deliberately DO NOT remap (so Windows-native behaviour survives):
;    Win + D        → show desktop
;    Win + E        → File Explorer
;    Win + L        → lock screen
;    Win + R        → Run dialog
;    Win + Arrows   → window snap / maximize
;    Win + Number   → launch / switch taskbar apps
; =============================================================================

#HotIf EnableWinToCommand

; ---- Editing ---------------------------------------------------------------
#a::Send("^a")                  ; Select All
#c::Send("^c")                  ; Copy
#x::Send("^x")                  ; Cut
#v::Send("^v")                  ; Paste
#z::Send("^z")                  ; Undo
#+z::Send("^y")                 ; Redo  (Mac: Cmd + Shift + Z)

; ---- File / App ------------------------------------------------------------
#s::Send("^s")                  ; Save
#w::Send("^w")                  ; Close tab / window
#q::Send("!{F4}")               ; Quit application  (Mac: Cmd + Q)
#n::Send("^n")                  ; New
#o::Send("^o")                  ; Open
#p::Send("^p")                  ; Print

; ---- Find / Format ---------------------------------------------------------
#f::Send("^f")                  ; Find
#h::Send("^h")                  ; Replace
#b::Send("^b")                  ; Bold
#i::Send("^i")                  ; Italic
#u::Send("^u")                  ; Underline
#k::Send("^k")                  ; Insert link

; ---- Tabs / Navigation ------------------------------------------------------
#t::Send("^t")                  ; New tab
#[::Send("^{PgUp}")             ; Previous tab  (Mac: Cmd + Shift + [)
#]::Send("^{PgDn}")             ; Next tab      (Mac: Cmd + Shift + ])

; ---- Word / line delete -----------------------------------------------------
#Backspace::Send("^{Backspace}") ; Delete previous word  (Mac: Cmd + Backspace)

#HotIf

; ---- App switcher (Mac: Cmd + Tab) -----------------------------------------
;  Gated by both the master switch and the MapWinTabToAltTab tweak.
#HotIf (EnableWinToCommand && MapWinTabToAltTab)
#Tab::Send("{Alt Down}{Tab}")   ; open the switcher while Win + Tab is held
#Tab up::Send("{Alt Up}")       ; confirm on release (just like Cmd + Tab)
#HotIf
