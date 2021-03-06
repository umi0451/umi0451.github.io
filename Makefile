THUMBS = $(shell grep -ahro --exclude _new_post.sh --exclude Makefile --exclude *swp --exclude-dir _site --exclude-dir .git 'thumbs/[^ "]\+')
#CV = cv.en.md cv.ru.md

all: $(THUMBS)
	jekyll build

#cv: $(CV)

# TODO: make proper template engine from _cv.py script
#cv.%.md: _cv.%.yml _cv.md _cv.py
#	python3 _cv.py $<

thumbs/%: images/%
	convert $^ -thumbnail '200x200>' $@
	git add $^
	git add $@

.PHONY: server
server: all
	nohup jekyll server &
