# 🧪 Your Tool – CLI Cheat Sheet

## 🧰 Daily Use
- `your-tool` — run the CLI
- `your-tool --quick` — (optional future flag)

## 🧪 Dev Tools
- `make test` — run a shell syntax check
- `make install` — install to `/usr/local/bin`
- `make uninstall` — remove from system

## 🔁 Versioning
- `make release-patch` — bumps x.y.Z → x.y.(Z+1)
- `make release-minor` — bumps x.Y.z → x.(Y+1).0
- `make release-major` — bumps X.y.z → (X+1).0.0

## 📝 Changelog Maintenance
- `make changelog-edit` — opens the most recent version section to add bullet points

## 🔁 GitHub Actions (Preconfigured)
- ✅ `test.yml` – shell syntax check on every push
- ✅ `autotag.yml` – tags new `VERSION="..."` commits
- ✅ `release.yml` – drafts GitHub Releases on new tag
