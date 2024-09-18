serve:
	bundle exec jekyll serve --watch

build:
	bundle exec jekyll build

deploy:
	netlify build
	netlify deploy --prod

clean:
	rm -rvf _site

update:
	bundle update

list-bucket:
	@gcloud storage ls --recursive gs://g.managedkaos.com/**

dig:
	dig managedkaos.com +noall +answer -t A
	dig managedkaos.com +noall +answer -t AAAA

