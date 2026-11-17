#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook
#WinActivateForce
SendMode "Input"

; -----------------------------------------------------------------------------
;  win-key-to-mac — turn your Windows keyboard into a Mac-like one.
;  Run this file (double-click) or compile it. All behaviour lives in /lib and
;  is configured through config/settings.ahk.
; -----------------------------------------------------------------------------

; Friendly tray menu
A_IconTip := "win-key-to-mac"
TrayMenu := A_TrayMenu
TrayMenu.Add()                                  ; separator
TrayMenu.Add("&Reload", (*) => Reload())
TrayMenu.Add("&Suspend / Resume", (*) => Suspend("Toggle"))
TrayMenu.Default := "&Reload"

; Load user configuration FIRST (defines the toggles the modules read).
#Include "config/settings.ahk"

; Core modules — Caps first: it calls SetCapsLockState() in the auto-execute
; section, which must run before the first hotkey is defined below.
#Include "lib/caps-to-ctrl.ahk"
#Include "lib/win-to-command.ahk"
#Include "lib/spacefn.ahk"
#Include "lib/hyper-key.ahk"
#Include "lib/app-launcher.ahk"

; Global pause: Win + Esc freezes every remap (handy while gaming).
; Resume afterwards from the tray menu → "Suspend / Resume".
#Esc::Suspend

; Quick reload: Ctrl + Win + R
^#r::Reload
