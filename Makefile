
.PHONY: all clean

all:
	latexmk -lualatex -halt-on-error -outdir=build mycv.tex

clean:
	rm -fr build/