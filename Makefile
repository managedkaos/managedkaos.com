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

requirements:
	pip install --requirement requirements.txt

lint:
	yamllint _config.yml

storage:
	@gcloud storage ls --recursive gs://g.managedkaos.com/** | sed 's/gs:\/\//https:\/\/storage.googleapis.com\//'

sync:
	@gsutil -o "GSUtil:parallel_process_count=1" rsync -r ./storage/ gs://g.managedkaos.com/
	@python ./scripts/update-storage-index.py

theme:
	open $(shell bundle info --path minima)

dig:
	dig managedkaos.com +noall +answer -t A
	dig managedkaos.com +noall +answer -t AAAA

.PHONY: serve build deploy clean update lint storage sync theme dig
