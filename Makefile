serve:
	bundle exec jekyll serve --watch

build:
	bundle exec jekyll build

clean:
	rm -rvf _site

dig:
	dig managedkaos.com +noall +answer -t A
	dig managedkaos.com +noall +answer -t AAAA

