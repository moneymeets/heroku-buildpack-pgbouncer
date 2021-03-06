build: build-cedar-14 build-heroku-16 build-heroku-18 build-heroku-20

build-cedar-14:
	@echo "Building pgbouncer in Docker for cedar-14..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=cedar-14" -e "PGBOUNCER_VERSION=1.7" -w /buildpack heroku/cedar:14 support/pgbouncer-build

build-heroku-16:
	@echo "Building pgbouncer in Docker for heroku-16..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-16" -w /buildpack heroku/heroku:16-build support/pgbouncer-build

build-heroku-18:
	@echo "Building pgbouncer in Docker for heroku-18..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-18" -w /buildpack heroku/heroku:18-build support/pgbouncer-build

build-heroku-20:
	@echo "Building pgbouncer in Docker for heroku-20..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-20" -w /buildpack heroku/heroku:20-build support/pgbouncer-build

shell:
	@echo "Opening heroku-18 shell..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-18" -e "PORT=5000" -w /buildpack heroku/heroku:18-build bash
