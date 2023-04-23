install:
	bundle install

start:
	bin/rails s -p 3000 -b "0.0.0.0"

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

test:
	bundle exec rake
	
.PHONY: test