; =============================================================================
;  Module: Caps Lock  →  Ctrl
; -----------------------------------------------------------------------------
;  The classic Mac keyboard habit: Caps Lock becomes a Ctrl modifier, so
;  Caps + C = Copy, Caps + A = Select All, Caps + S = Save, and so on.
;
;  The CapsLock LED is forced off and capitalisation never toggles while the
;  module is active. Gated by EnableCapsToCtrl (config/settings.ahk).
; =============================================================================

; Runs once at startup (this include is placed before any hotkey definitions).
if (EnableCapsToCtrl)
    SetCapsLockState("AlwaysOff")

#HotIf EnableCapsToCtrl
*CapsLock::Send("{Ctrl Down}")
*CapsLock up::Send("{Ctrl Up}")
#HotIf
