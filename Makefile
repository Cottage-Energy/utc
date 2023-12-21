.PHONY: build
build:
	@rm -rf ./date # Clear the build output directory
	@env npx babel src --source-root src --out-dir . --extensions .mjs --out-file-extension .js --ignore "src/**/test.ts" --quiet
	@find src -name '*.d.ts' -exec cp {} . \; # Copy .d.ts files
	@find src -name '*.mjs' -exec cp {} . \; # Copy .mjs files
	@cp *.md .

publish: build
	@npm publish --access public

publish-next: build
	@npm publish --access public --tag next
