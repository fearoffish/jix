.PHONY: help
help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: darwin
darwin:
	env NIX_CONF_DIR="$(CURDIR)" nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
	env NIX_CONF_DIR="$(CURDIR)" ./result/bin/darwin-installer

.PHONY: bootstrap
bootstrap: ## Activate system on fresh MacOS.
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
	sudo rm -f /etc/nix/nix.conf && \
	env NIX_CONF_DIR="$(CURDIR)" nix run

.PHONY: update
update: ## Update flake inputs.
	nix flake update

.PHONY: starship
starship: ## Generate starship settings from a preset
	starship preset pure-preset | ./nix/homeConfigurations/jix/fish/starship/scripts/convert_starship.rb

.PHONY: install
install: ## Activate system
	nix run

.PHONY: test
test: ## Test system is installable.
	nix flake check
	nix run '.#format' -- --check .

.PHONY: format
format: ## Format all nix files.
	nix run '.#format' -- --quiet .

.PHONY: rollback
rollback: # roll back the latest generation
	nix run -- --rollback .
