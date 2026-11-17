; =============================================================================
;  Module: App launcher (optional)
; -----------------------------------------------------------------------------
;  Disabled by default. Turn it on with EnableAppLauncher in config/settings.ahk.
;
;  When enabled, Win + Space opens Windows Search — the closest built-in thing
;  to macOS Spotlight (Cmd + Space). You can also register your own app hotkeys.
;
;  Example (uncomment the block below and edit the paths):
;    #HotIf EnableAppLauncher
;    #1::Run("notepad.exe")
;    #2::Run("calc.exe")
;    #e::Run("C:\Program Files\Everything\Everything.exe")
;    #HotIf
; =============================================================================

#HotIf EnableAppLauncher
#Space::Send("#s")             ; open Windows Search (Spotlight-like)
#HotIf
