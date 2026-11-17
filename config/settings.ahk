; =============================================================================
;  win-key-to-mac · user settings
; -----------------------------------------------------------------------------
;  Edit the values below to personalize the script, then reload it
;  (right-click the tray icon → Reload, or press Ctrl + Win + R).
;
;  Every option takes effect live through the #HotIf directives, so no
;  recompile is required. Each variable is in the global scope and is read by
;  the modules under lib/.
; =============================================================================

; --- Master switches ---------------------------------------------------------
EnableCapsToCtrl    := true    ; Caps Lock acts as Ctrl (LED stays off)
EnableWinToCommand := true     ; Windows key remapped to Mac-style shortcuts
EnableSpaceFN       := true    ; Hold Space = arrow-key / cursor navigation layer
EnableHyperKey      := true    ; Hold Tab    = Hyper (Ctrl + Shift + Alt + Win)
EnableAppLauncher   := false   ; Win + Space opens Windows Search (Spotlight-like)

; --- Behaviour tweaks --------------------------------------------------------
MapWinTabToAltTab   := true    ; Win + Tab behaves like Mac Cmd + Tab (Alt + Tab)
