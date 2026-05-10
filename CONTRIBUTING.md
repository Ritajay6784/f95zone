# Contributing to YAM

Thank you for wanting to help! YAM is a community project and every contribution counts — whether it's fixing a typo, adding a translation, or writing new features.

---

## Ways to Contribute

### 🌍 Translations (no coding required)
Translations are managed on **[Crowdin](https://crwd.in/yam)**. Sign up, pick your language, and start translating. Changes are automatically submitted as pull requests.

Current languages: 🇬🇧 🇮🇹 🇪🇸 🇵🇹 🇩🇪 🇨🇳 🇷🇺 🇳🇱

### 🐛 Bug Reports
1. Search [existing issues](https://github.com/MillenniumEarl/YAM/issues) first
2. Open a [new issue](https://github.com/MillenniumEarl/YAM/issues/new) with:
   - YAM version
   - OS and version
   - Steps to reproduce
   - Expected vs actual behavior
   - Logs from `%AppData%\yam\logs\`

### ✨ Feature Requests
Open an issue with the `enhancement` label. Describe the use case, not just the feature.

### 🔧 Code Contributions

**Setup:**
```bash
git clone https://github.com/MillenniumEarl/YAM.git
cd YAM
npm install
npm start          # dev mode with DevTools
```

**Code style:**
- ESLint config is in `.eslintrc.json` — run `npx eslint .` before committing
- Files use **kebab-case** naming: `my-component.js`
- Electron files follow `name-renderer.js` / `name-preload.js` convention
- All main↔renderer communication goes through IPC + ContextBridge — never enable `nodeIntegration`

**Pull Request process:**
1. Fork the repository
2. Create a branch: `git checkout -b feat/description` or `fix/description`
3. Make your changes and test them
4. Open a PR with a clear title and description

---

## Architecture Notes

- **Main process** (`app/app.js`): Electron main, handles OS integration, IPC, and the F95API wrapper
- **Renderer processes** (`app/electron/window/*/`): Each window has its own preload + renderer pair, communicating only through IPC
- **Database** (`app/db/`): NeDB-based local storage for the game library
- **F95API** (`@millenniumearl/f95api`): The library that interfaces with F95Zone — if you find platform-specific bugs, they may belong in [that repo](https://github.com/MillenniumEarl/F95API) instead

---

## Questions?

Open a [Discussion](https://github.com/MillenniumEarl/YAM/discussions) or an [Issue](https://github.com/MillenniumEarl/YAM/issues). We're friendly!
