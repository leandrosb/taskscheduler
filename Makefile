clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	rm -rf .cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	rm -rf htmlcov
	rm -rf .tox/
	rm -rf docs/_build

lint:
	flake8 taskscheduler

test:
	FLASK_ENV=test python -m pytest tests/ -v --cov=taskscheduler

run:
	APP_ENV=local FLASK_APP=taskscheduler FLASK_ENV=development flask run