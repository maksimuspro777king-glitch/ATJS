translator:
	pp -o bin/atjs t/translator.pl
run:
	./bin/atjs --version
clean_v:
	rm -rf bin
all:
	rm -rf bin
	pp -o bin/atjs t/translator.pl
	./bin/atjs --version