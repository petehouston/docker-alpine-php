###############################################################################
# The build script for petehouston/docker-alpine-php image
#
# @image 		petehouston/docker-alpine-php
# @author 		Pete Houston <contact@petehouston.com>
# @github 		https://github.com/petehouston/docker-alpine-php/
# @dockerhub 	https://hub.docker.com/r/petehouston/docker-alpine-php/
#
###############################################################################

# config
IMAGE=petehouston/docker-alpine-php
DOCKER=`which docker`
SRC=`pwd`/src
PHP_55=5.5
PHP_56=5.6
PHP_70=7.0

# commands
php-5.5:
	@${DOCKER} build -f ${SRC}/${PHP_55}/Dockerfile -t ${IMAGE}:${PHP_55} ${SRC}/${PHP_55}/

php-5.6:
	@${DOCKER} build -f ${SRC}/${PHP_56}/Dockerfile -t ${IMAGE}:${PHP_56} ${SRC}/${PHP_56}/

php-7.0:
	@${DOCKER} build -f ${SRC}/${PHP_70}/Dockerfile -t ${IMAGE}:${PHP_70} ${SRC}/${PHP_70}/

build: php-5.5 php-5.6 php-7.0

all: build test

test:
	@sh tests/index.sh

.PHONY: clean

clean:
	@${DOCKER} rmi ${IMAGE}:${PHP_55}
	@${DOCKER} rmi ${IMAGE}:${PHP_56}
	@${DOCKER} rmi ${IMAGE}:${PHP_70}