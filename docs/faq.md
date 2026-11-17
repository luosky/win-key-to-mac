# FAQ & Troubleshooting

### The script doesn't start / nothing happens
- Make sure you installed **AutoHotkey v2.0+**, not v1. Right-click `win-key-to-mac.ahk` →
  *Run with AutoHotkey v2* if multiple versions are installed.
- Check the tray (bottom-right) for the `win-key-to-mac` icon. If it's there, the script is running.

### Caps Lock behaves like Ctrl but I want the LED / normal caps back
- Set `EnableCapsToCtrl := false` in `config/settings.ahk` and reload. The module also forces
  the CapsLock LED off via `SetCapsLockState("AlwaysOff")`; turning it off restores normal behaviour.

### Hotkeys don't work in a specific app (e.g. an editor or game)
- Some apps run as **administrator**. AutoHotkey hotkeys only affect windows at the same or lower
  privilege level. Run `win-key-to-mac.ahk` **as administrator** too (or vice-versa).
- Games often capture input at a low level. Use `Win + Esc` to suspend all remaps while gaming,
  then resume from the tray menu.

### Antivirus flags or blocks the script
- A few AV tools mistakenly flag AutoHotkey scripts. Add the script folder to your AV allow-list.
  Compiling to an `.exe` with the official AHK compiler can also help.

### `Win + V` no longer opens the Windows clipboard history
- By design, `Win + V` is remapped to Paste (Mac-style). If you want the native clipboard history
  back, delete/comment the `#v::Send("^v")` line in `lib/win-to-command.ahk` and reload.

### I want the real Windows key behaviour back temporarily
- Press `Win + Esc` to suspend every remap. Resume via the tray icon → *Suspend / Resume*.

### Space feels laggy when typing
- The SpaceFN module waits to see whether you tap Space alone or combine it with a letter.
  A lone Space is sent on key release, which can feel like a tiny delay. If you don't use SpaceFN,
  set `EnableSpaceFN := false` in `config/settings.ahk`.

### How do I add my own shortcut?
- Open the relevant `lib/*.ahk` file, add a hotkey (see `docs/keymap.md` for examples), reload.

### Settings changed but nothing happened
- After editing `config/settings.ahk`, reload the script (tray icon → Reload, or `Ctrl + Win + R`).
