.DEFAULT_GOAL := help

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: jupyter-notebook-gpu
jupyter-notebook-gpu: ## Build a jupyter notebook server on Docker with gpu
	docker run --gpus all -v ${PWD}:/tmp/working -w=/tmp/working -p 8888:8888 --rm -it\
		gcr.io/kaggle-gpu-images/python:v101\
		jupyter notebook --no-browser --ip="0.0.0.0" --notebook-dir=/tmp/working --allow-root
