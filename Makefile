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
	flake8 --ignore=E501,W503 --exit-zero ./scripts/*.py
	pylint --errors-only --disable=C0301 ./scripts/*.py
	black --diff --check ./scripts/*.py
	yamllint _config.yml

black:
	black ./scripts/*.py

theme:
	open $(shell bundle info --path minima)

dig:
	dig managedkaos.com +noall +answer -t A
	dig managedkaos.com +noall +answer -t AAAA

# Run gcloud-auth authenticate with gcloud before making the following targets:
# - storage
# - sync
gcloud-auth:
	gcloud auth login
	gcloud auth application-default login

gcloud-storage:
	@gcloud storage ls --recursive gs://g.managedkaos.com/** | sed 's/gs:\/\//https:\/\/storage.googleapis.com\//'

gloud-sync:
	@gsutil -o "GSUtil:parallel_process_count=1" rsync -r ./storage/ gs://g.managedkaos.com/
	@python ./scripts/update_storage_index.py

.PHONY: serve build deploy clean update requirements lint black theme dig gcloud-auth gcloud-storage gcloud-sync
