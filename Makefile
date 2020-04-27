DOTPATH := `pwd`

.DEFAULT_GOAL := help
.PHONY: list deploy update clean help

list: ## List dotfiles
	@DOTPATH=$(DOTPATH) bash ./etc/scripts/list.sh

deploy: ## Make symbolic links
	@DOTPATH=$(DOTPATH) bash ./etc/scripts/deploy.sh

clean: ## Remove symbolic links
	@DOTPATH=$(DOTPATH) bash ./etc/scripts/clean.sh

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' ${MAKEFILE_LIST} \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n\033[0;39m", $$1, $$2}'
