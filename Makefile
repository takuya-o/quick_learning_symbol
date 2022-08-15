all : book

clean :
	rm -f quick_learning_symbol.html quick_learning_symbol.pdf

texttest : *.md
	textlint -f unix *.md

book : quick_learning_symbol.html quick_learning_symbol.pdf

quick_learning_symbol.html : *.md style.css
	pandoc -s --toc --toc-depth=6 "--mathjax=https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-MML-AM_CHTML" -o $@ -H style.css  pandoc_title_block [0-9]*.md

quick_learning_symbol.pdf : quick_learning_symbol.html
	LANG=ja_JP.UTF-8 xvfb-run wkhtmltopdf --page-size A4 --minimum-font-size 24 $< $@

.PHONY : all book clean texttest
