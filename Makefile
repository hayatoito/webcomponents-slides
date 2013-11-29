.PHONY: all open watch presentme install_lib

all: index.html theme/css/default.css

open: all
	open index.html

index.html: scripts/md/slides.md scripts/md/base.html
	cd scripts/md && python3 render.py

theme/css/default.css: theme/scss/default.scss theme/scss/_base.scss
	compass compile

presentme: index.html
	open 'index.html?presentme=true'

presentmeno: index.html
	open 'index.html?presentme=false'

watch:
	fswatch scripts/md "make all"

compass_watch:
	compass watch

install_lib:
	pip-3.3 install jinja2
	pip-3.3 install makedown
	gem install compass
