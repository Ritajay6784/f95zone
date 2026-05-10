# Changelog

All notable changes to YAM are documented here.

---

## [2.6.3] — 2022-04-14

### Fixed
- Fixed crash on startup for some users with corrupted database entries
- Improved stability of the update-check routine

---

## [2.6.2] — 2022-03-28

### Added
- Save export/import support for Ren'Py and RPGM games (Beta)
- Dutch 🇳🇱 language added via Crowdin

### Fixed
- Game covers not loading on slow connections
- Duplicate game detection edge cases

---

## [2.6.0] — 2022-02-10

### Added
- Step-by-step **update wizard** — guides you through downloading and applying updates
- Automatic directory rename after update is marked complete
- Russian 🇷🇺 language support

### Changed
- Migrated to Electron 18
- Improved IPC security using ContextBridge throughout
- Performance: faster startup via `v8-compile-cache`

### Fixed
- Games added as duplicates when folder name casing differs
- Update badge not clearing after wizard completes

---

## [2.5.0] — 2021-11-05

### Added
- Multi-folder add: select multiple game directories at once
- Chinese 🇨🇳 language support

### Fixed
- Login failures with special characters in password
- Crash when F95Zone is unreachable at startup

---

## [2.4.0] — 2021-09-15

### Added
- Game update notifications shown at startup
- Add game by URL mode (for non-standard folder names)
- Portuguese 🇵🇹 and Spanish 🇪🇸 languages

### Changed
- Switched local database to NeDB for better reliability
- Redesigned game cards with cover images

---

*See all releases on the [GitHub Releases page](https://github.com/MillenniumEarl/YAM/releases).*
