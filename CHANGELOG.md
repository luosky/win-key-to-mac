# Changelog

All notable changes to this project are documented here. The format is based on
[Keep a Changelog](https://keepachangelog.com/), and this project adheres to
[Semantic Versioning](https://semver.org/).

## [1.1.0] - 2026-11-18

### Added
- **Caps → Ctrl** module: Caps Lock acts as a Ctrl modifier while the LED stays off
  (toggle with `EnableCapsToCtrl`, on by default).

## [1.0.0] - 2026-09-21

### Added
- **Win → Command** module: remap the Windows key to macOS-style shortcuts
  (copy/paste/undo/save/quit/tabs/app-switcher, …).
- **SpaceFN** module: hold Space for a Vim-style cursor navigation layer.
- **Hyper key** module: hold Tab to get a `Ctrl+Shift+Alt+Win` modifier.
- **App launcher** module (optional): `Win + Space` opens Windows Search.
- Central `config/settings.ahk` with live, reloadable toggles.
- Full keymap reference and FAQ in `docs/`.
- `tools/setup-repo.ps1` helper to publish to GitHub in one step.
