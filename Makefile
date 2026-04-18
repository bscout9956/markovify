.PHONY: venv requirements tests check-black check-flake lint format

venv:
	python3 -m venv venv

requirements:
	pip install --upgrade pip
	pip install -r requirements-dev.txt
	pip install -e .

tests:
	uv run pytest test
	uv run coverage html

check-black:
	uv run black --check markovify test

check-flake:
	uv run flake8 markovify test

lint: check-flake check-black

format:
	uv run black markovify test
