
################################################
## run from machine with docker installed
## requires GNU Make
################################################

ubuntu: 
	docker compose run --rm ubuntu 


#########################################################
## run from machine or container with required software
## python, pip, GNU Make, etc.
#########################################################
install-build-requirements:
	pip install --upgrade build

build-pip-dist:
	python -m build --outdir ./dist

build: clean install-build-requirements build-pip-dist

check-dist:
	tar tf dist/*.tar.gz
	unzip -l dist/*.whl

clean-build:
	rm -rf build/

clean-dist:
	rm -rf dist/

clean: clean-dist clean-build

install-tox:
	python -m pip install -U tox

tox: install-tox clean
	python -m tox -e py 