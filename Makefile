.PHONY: build
build:
	@echo "Building the package"
	@rm -rf date # Remove the old date directory in the output if it exists
	@mkdir -p date # Create the date directory in the output
	@env npx babel src --source-root src --out-dir . --extensions .mjs --out-file-extension .js --ignore "src/**/test.ts" --quiet
	@cp src/date/*.d.ts date/ # Copy TypeScript declaration files from src/date to output date
	@cp src/date/*.mjs date/ # Copy ES module files from src/date to output date

publish: build
	@echo "Publishing the package"
	@npm publish --access public

publish-next: build
	@echo "Publishing the package with 'next' tag"
	@npm publish --access public --tag next
