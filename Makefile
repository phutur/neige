bin=./node_modules/.bin
build=_build/default
src_ocaml=src/ocaml
dist=_dist

.PHONY: clear all tarball packet

all: build

build: dark init_dist backend frontend fetch_css
	@tput setaf 6
	@echo "neige is built"
	@tput sgr0

watch: build
	make run &
	while true; do \
		fswatch -r -1 src/; \
		make build; \
	done

run: backend
	$(bin)/electron $(dist)/backend_neige.bc.js

fetch_css: init_dist
	cp -R src/css $(dist)

frontend: frontend/frontend_neige.bc.js neige.elm.js

backend: backend/backend_neige.bc.js

install: init_dist
	opam pin add -y .
	npm install
	$(bin)/elm-package install -y
	jbuilder build @install

%.bc.js:
	jbuilder external-lib-deps --missing $(src_ocaml)/$(@)
	jbuilder build $(src_ocaml)/$(@)
	cp $(build)/$(src_ocaml)/$(@) $(dist)/$(F@)

neige.elm.js:
	$(bin)/elm-make src/elm/Main.elm --output=_dist/$(@)

init_dist:
	mkdir -p _dist

app: install build
	rm -rf neige.tar.gz
	$(bin)/electron-packager . neige --overwrite --ignore neige.opam

tarball: app
	tar zcvf neige.tar.gz neige-darwin-x64

clean:
	jbuilder clean
	rm -rf node_modules
	rm -rf elm-stuff
	rm -rf _dist
	rm -rf neige-darwin-x64
	rm -rf *.tar.gz
	opam pin remove -y .

dark:
	@tput setaf 0
