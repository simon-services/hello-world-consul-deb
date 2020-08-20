.PHONY: all
all: build 

build: clean 
	mkdir tmp
	rsync -ax --exclude tmp ./ tmp/
	rm -rfv tmp/Makefile tmp/.git tmp/.gitignore tmp/LICENSE tmp/README.md tmp/cmd tmp/pkg
	dpkg-deb --build tmp hello-world-consul-0.0.1-amd64.deb
	rm -rf tmp

.PHONY: clean 
clean:
	rm -fv *~ .*.swp *.deb
	rm -rf tmp

