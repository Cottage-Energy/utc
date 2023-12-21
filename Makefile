.PHONY: build clean

# Define source and output directories
SRC_DIR := src
OUT_DIR := .
DATE_DIR := date

build: clean
	@echo "Building the package"
	# Transpile JS files and copy them to the root directory
	@env npx babel $(SRC_DIR) --out-dir $(OUT_DIR) --extensions .mjs,.ts --out-file-extension .js --ignore "$(SRC_DIR)/**/test.ts" --quiet
	# Copy TypeScript declaration files and ES module files to the root directory
	@cp $(SRC_DIR)/*.d.ts $(OUT_DIR)/
	@cp $(SRC_DIR)/*.mjs $(OUT_DIR)/
	# Create the date directory in the output and copy corresponding files
	@mkdir -p $(OUT_DIR)/$(DATE_DIR)
	@cp $(SRC_DIR)/$(DATE_DIR)/*.d.ts $(OUT_DIR)/$(DATE_DIR)/
	@cp $(SRC_DIR)/$(DATE_DIR)/*.mjs $(OUT_DIR)/$(DATE_DIR)/

clean:
	@echo "Cleaning the output directory"
	@rm -rf $(OUT_DIR)/$(DATE_DIR) $(OUT_DIR)/*.js $(OUT_DIR)/*.mjs $(OUT_DIR)/*.d.ts

publish: build
	@echo "Publishing the package"
	@npm publish --access public

publish-next: build
	@echo "Publishing the package with 'next' tag"
	@npm publish --access public --tag next
