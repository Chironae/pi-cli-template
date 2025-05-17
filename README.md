# Pi CLI Template

*Starter kit for building clean, release-ready CLI tools on your Raspberry Pi.*

[![GitHub release](https://img.shields.io/github/v/release/YOUR_USERNAME/pi-cli-template?include_prereleases&sort=semver)](https://github.com/YOUR_USERNAME/pi-cli-template/releases)

---

## 🚀 Quick Start

```bash
make install
your-tool
```

Replace `your-tool.sh` with your own script and start building your command-line utility.

---

## 📦 Features

- ✅ `VERSION` string embedded in script (auto-tagged on push)
- ✅ `Makefile` with release/versioning commands
- ✅ GitHub Actions for:
  - Shell syntax check
  - Auto-tagging based on `VERSION`
  - Auto-draft GitHub releases
- ✅ Markdown changelog with auto-appender
- ✅ Editable `README_CHEATSHEET.md` included

---

## 🔧 Versioning

- `make release-patch` → bump 0.1.0 → 0.1.1
- `make release-minor` → bump 0.1.1 → 0.2.0
- `make release-major` → bump 0.2.0 → 1.0.0

Each command:
- Updates `VERSION="..."` in the script
- Appends to `CHANGELOG.md`
- Commits + pushes
- Auto-tags via GitHub Actions

---

## 📝 Changelog Editing

After bumping, use:

```bash
make changelog-edit
```

- Opens the latest `## [x.y.z]` section in `CHANGELOG.md`
- Lets you add meaningful entries like a civilized dev

---

## 🧪 Testing

```bash
make test
```

- Runs a `bash -n` syntax check on your tool

---

## 🛠 Structure

```text
your-project/
├── your-tool.sh
├── setup.sh
├── Makefile
├── VERSION
├── CHANGELOG.md
├── README.md
├── README_CHEATSHEET.md
├── config/
│   └── sample-config.json
└── .github/
    └── workflows/
        ├── test.yml
        ├── release.yml
        └── autotag.yml
```

---

## 🧱 Built For

- Raspberry Pi dev environments
- Pi Project Switcher integrations
- One-command install workflows
- Nerds who track their versions like pros

