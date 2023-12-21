.PHONY: build
build:
	@env npx babel src --source-root src --out-dir . --extensions .mjs --out-file-extension .js --ignore "src/**/test.ts" --quiet

publish: build
	@npm publish --access public

publish-next: build
	@npm publish --access public --tag next
