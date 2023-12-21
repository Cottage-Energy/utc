.PHONY: build
build:
	@rm -rf ./date # Clear the build output directory for 'date'
	@env npx babel src --source-root src --out-dir . --extensions .mjs --out-file-extension .js --ignore "src/**/test.ts" --quiet
	@mkdir -p ./date # Create the output 'date' directory if it doesn't exist
	@find src -name '*.d.ts' -exec cp {} . \; # Copy .d.ts files from 'src' to root
	@find src/date -name '*.d.ts' -exec cp --parents {} . \; # Copy .d.ts files from 'src/date' to 'date'
	@find src -name '*.mjs' -exec cp {} . \; # Copy .mjs files from 'src' to root
	@find src/date -name '*.mjs' -exec cp --parents {} . \; # Copy .mjs files from 'src/date' to 'date'

publish: build
	@npm publish --access public

publish-next: build
	@npm publish --access public --tag next
