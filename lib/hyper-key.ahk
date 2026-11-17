; =============================================================================
;  Module: Tab → Hyper key (Ctrl + Shift + Alt + Win)
; -----------------------------------------------------------------------------
;  Hold Tab to get a dedicated "Hyper" modifier you can bind your own macros to
;  (a Hyper combo can't collide with anything Windows or apps already use).
;  A quick tap of Tab still sends a normal Tab. Alt + Tab keeps its native
;  behaviour so you can still switch apps the normal way.
;  Gated by EnableHyperKey (config/settings.ahk).
; =============================================================================

; 1. While Alt is held, let Tab behave natively (preserve Alt + Tab).
#HotIf (EnableHyperKey && GetKeyState("Alt", "P"))
*Tab::Send("{Blind}{Tab}")
#HotIf

; 2. Otherwise, pressing Tab holds down the whole Hyper chord.
#HotIf (EnableHyperKey && !GetKeyState("Alt", "P"))
*$Tab::Send("{Ctrl Down}{Shift Down}{Alt Down}{Win Down}")

*$Tab up:: {
    Send("{Ctrl Up}{Shift Up}{Alt Up}{Win Up}")
    ; A plain tap (no other key used while held) sends a real Tab.
    if (A_PriorKey = "Tab") {
        Send("{Blind}{Tab}")
    }
}
#HotIf
