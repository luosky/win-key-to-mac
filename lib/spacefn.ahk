; =============================================================================
;  Module: SpaceFN navigation layer
; -----------------------------------------------------------------------------
;  Hold Space and tap a letter to move the cursor / scroll the page — just like
;  using a Mac trackpad. A quick tap of Space still types a normal space.
;  Gated by EnableSpaceFN (config/settings.ahk).
;
;  Default layer:
;    h / j / k / l        → Left / Down / Up / Right   (Vim-style)
;    d / g               → previous / next word
;    e / n               → line start (Home) / line end (End)
;    u / i               → PageUp / PageDown
;
;  To add your own, copy a line under the #HotIf block below.
; =============================================================================

#HotIf EnableSpaceFN

global SpaceFN_Active := false

*$Space:: {
    global SpaceFN_Active := true
}

*$Space up:: {
    global SpaceFN_Active := false
    ; If Space was tapped alone (no other key in between), emit a real Space.
    if (A_PriorKey = "Space") {
        Send("{Blind}{Space}")
    }
}

#HotIf (EnableSpaceFN && SpaceFN_Active)

; Arrows
*h::Send("{Blind}{Left}")
*j::Send("{Blind}{Down}")
*k::Send("{Blind}{Up}")
*l::Send("{Blind}{Right}")

; Word / line movement
*d::Send("{Blind}^{Left}")     ; previous word
*g::Send("{Blind}^{Right}")    ; next word
*e::Send("{Blind}{Home}")      ; line start
*n::Send("{Blind}{End}")       ; line end

; Page movement
*u::Send("{Blind}{PgUp}")
*i::Send("{Blind}{PgDn}")

#HotIf
