APP_NAME=your-tool
INSTALL_PATH=/usr/local/bin

help:
	@echo "Usage:"
	@echo "  make install         - Install $(APP_NAME) globally"
	@echo "  make uninstall       - Remove from system"
	@echo "  make test            - Run syntax check"
	@echo "  make release         - Bump, commit, tag, push"
	@echo "  make release-patch   - Bump patch version"
	@echo "  make release-minor   - Bump minor version"
	@echo "  make release-major   - Bump major version"
	@echo "  make tag-release     - Create and push git tag"
	@echo "  make changelog-edit  - Edit latest changelog entry"

install:
	chmod +x $(APP_NAME).sh
	cp $(APP_NAME).sh $(INSTALL_PATH)/$(APP_NAME)

uninstall:
	rm -f $(INSTALL_PATH)/$(APP_NAME)

test:
	bash -n $(APP_NAME).sh

release-patch:
	@$(MAKE) bump VERSION_PART=patch

release-minor:
	@$(MAKE) bump VERSION_PART=minor

release-major:
	@$(MAKE) bump VERSION_PART=major

bump:
	@echo "🔧 Bumping $(VERSION_PART) version..."
	@OLD=$$(grep -m1 'VERSION="' $(APP_NAME).sh | sed -E 's/[^0-9.]*([0-9]+\.[0-9]+\.[0-9]+).*/\1/'); \
	MAJOR=$$(echo $$OLD | cut -d. -f1); \
	MINOR=$$(echo $$OLD | cut -d. -f2); \
	PATCH=$$(echo $$OLD | cut -d. -f3); \
	if [ "$(VERSION_PART)" = "patch" ]; then PATCH=$$((PATCH+1)); fi; \
	if [ "$(VERSION_PART)" = "minor" ]; then MINOR=$$((MINOR+1)); PATCH=0; fi; \
	if [ "$(VERSION_PART)" = "major" ]; then MAJOR=$$((MAJOR+1)); MINOR=0; PATCH=0; fi; \
	NEW_VERSION="$$MAJOR.$$MINOR.$$PATCH"; \
	sed -i "s/VERSION=\"[0-9]*\.[0-9]*\.[0-9]*\"/VERSION=\"$$NEW_VERSION\"/" $(APP_NAME).sh; \
	echo "\n## [$$NEW_VERSION] – $$(date +%Y-%m-%d)\n" >> CHANGELOG.md; \
	git add $(APP_NAME).sh CHANGELOG.md; \
	git commit -m "Bump version to $$NEW_VERSION"; \
	git push

tag-release:
	@echo "🏷️  Tagging current version..."
	@VERSION=$$(grep '^VERSION="' $(APP_NAME).sh | cut -d'"' -f2); \
	if git rev-parse "v$$VERSION" >/dev/null 2>&1; then \
	  echo "❌ Tag v$$VERSION already exists. Skipping."; \
	else \
	  git tag "v$$VERSION"; \
	  git push origin "v$$VERSION"; \
	  echo "✅ Tagged and pushed: v$$VERSION"; \
	fi

release: release-patch tag-release
	@echo "🚀 Full release pushed and tagged!"

changelog-edit:
	@LATEST=$$(grep '^## \[' CHANGELOG.md | head -n 1); \
	if [ -z "$$LATEST" ]; then \
	  echo "❌ No changelog entries found."; exit 1; \
	fi; \
	sed -i "/^$$LATEST/a\\\n- " CHANGELOG.md; \
	nano +$$(grep -n "^$$LATEST" CHANGELOG.md | cut -d: -f1) CHANGELOG.md
