# Keymap reference

All mappings are active only when their module is enabled in `config/settings.ahk`.
`Win` = the Windows key (the physical ⌘ Command key on a Mac keyboard).

---

## 1. Caps Lock → Ctrl (`EnableCapsToCtrl`)

Caps Lock becomes a **Ctrl modifier**; the LED stays off and capitalisation never toggles.
`Caps + C` → Copy, `Caps + A` → Select All, and so on. The physical Ctrl keys keep working as before.

---

## 2. Win → Command (`EnableWinToCommand`)

| Combo | Sends | Mac equivalent |
|-------|-------|----------------|
| `Win + A` | `Ctrl + A` | Select All |
| `Win + C` | `Ctrl + C` | Copy |
| `Win + X` | `Ctrl + X` | Cut |
| `Win + V` | `Ctrl + V` | Paste |
| `Win + Z` | `Ctrl + Z` | Undo |
| `Win + Shift + Z` | `Ctrl + Y` | Redo |
| `Win + S` | `Ctrl + S` | Save |
| `Win + W` | `Ctrl + W` | Close tab / window |
| `Win + Q` | `Alt + F4` | Quit application |
| `Win + N` | `Ctrl + N` | New |
| `Win + O` | `Ctrl + O` | Open |
| `Win + P` | `Ctrl + P` | Print |
| `Win + F` | `Ctrl + F` | Find |
| `Win + H` | `Ctrl + H` | Replace |
| `Win + B` | `Ctrl + B` | Bold |
| `Win + I` | `Ctrl + I` | Italic |
| `Win + U` | `Ctrl + U` | Underline |
| `Win + K` | `Ctrl + K` | Insert link |
| `Win + T` | `Ctrl + T` | New tab |
| `Win + [` | `Ctrl + PageUp` | Previous tab |
| `Win + ]` | `Ctrl + PageDown` | Next tab |
| `Win + Backspace` | `Ctrl + Backspace` | Delete previous word |
| `Win + Tab` *(if `MapWinTabToAltTab`)* | `Alt + Tab` | App switcher |

### Preserved native shortcuts (not remapped)
`Win + D` (desktop), `Win + E` (Explorer), `Win + L` (lock), `Win + R` (Run),
`Win + Arrows` (snap), `Win + Number` (taskbar).

---

## 3. SpaceFN (`EnableSpaceFN`)

Hold **Space**, then tap a key. A quick Space tap still types a space.

| Key (while Space held) | Sends | Meaning |
|------------------------|-------|---------|
| `h` | `Left` | Cursor left |
| `j` | `Down` | Cursor down |
| `k` | `Up` | Cursor up |
| `l` | `Right` | Cursor right |
| `d` | `Ctrl + Left` | Previous word |
| `g` | `Ctrl + Right` | Next word |
| `e` | `Home` | Line start |
| `n` | `End` | Line end |
| `u` | `PageUp` | Page up |
| `i` | `PageDown` | Page down |

---

## 4. Hyper key (`EnableHyperKey`)

Hold **Tab** to press `Ctrl + Shift + Alt + Win` simultaneously — a modifier no app uses,
perfect for your own macros. A quick Tab tap still sends a normal Tab. `Alt + Tab` keeps its
native behaviour.

Example custom macro you could add:

```ahk
#HotIf (EnableHyperKey && !GetKeyState("Alt", "P"))
*Tab & f::MsgBox("Hyper + F was pressed!")
#HotIf
```

---

## 5. App launcher (`EnableAppLauncher`)

| Combo | Action |
|-------|--------|
| `Win + Space` | Open Windows Search (Spotlight-like) |

Enable it in `config/settings.ahk`. See `lib/app-launcher.ahk` for how to bind your own apps.
