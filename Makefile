serve:
	bundle exec jekyll serve --watch

build:
	bundle exec jekyll build

deploy: build
	netlify deploy --prod

clean:
	rm -rvf _site

dig:
	dig managedkaos.com +noall +answer -t A
	dig managedkaos.com +noall +answer -t AAAA
	dig staging.managedkaos.com  +noall +answer

