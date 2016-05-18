FROM petehouston/docker-alpine-core

MAINTAINER Pete Houston <contact@petehouston.com>

ENV PHP_VERSION 7.0.6

RUN apk update && apk upgrade

CMD ["mkdir", "/tmp/php"]

ADD ./scripts/compile_php.sh /tmp/php/

RUN /bin/sh /tmp/php/compile_php.sh ${PHP_VERSION}

CMD ["/usr/bin/php"]