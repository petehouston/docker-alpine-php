# Docker Alpine PHP

[![](https://imagelayers.io/badge/petehouston/docker-alpine-php:latest.svg)](https://imagelayers.io/?images=petehouston/docker-alpine-php:latest 'Get your own badge on imagelayers.io')

A very small Docker image to bootstrap your PHP development.

### Why this image?

Of course, there are [official PHP images](https://hub.docker.com/_/php/) but the size looks a little big for my development machine, and I also prefer some customization on my builds.

In addition, I sometimes want to quickly run a small PHP script, so I don't really need that big-in-size official images.

The size-differences illustrated below:

```
REPOSITORY                      TAG          IMAGE ID       CREATED       SIZE
petehouston/docker-alpine-php   5.5          76642fdcb40d   5 hours ago   136.4 MB
petehouston/docker-alpine-php   5.6          d4a16ab8659b   6 hours ago   137.2 MB
petehouston/docker-alpine-php   7.0          5a2b3687d124   9 hours ago   138.5 MB

php                             7.0-alpine   562f31e64296   12 days ago   382.9 MB
php                             5.6-alpine   7bc0403e7fa9   12 days ago   334.7 MB
php                             5.5-alpine   76323652d59f   12 days ago   330.8 MB
```

As you can see, **the difference is around 2.5-3 times**.

### Supported Versions

Following PHP versions are set as default

* [tag:7.0](7.0/Dockerfile) (7.0.6)
* [tag:5.6](5.6/Dockerfile) (5.6.21)
* [tag:5.5](5.5/Dockerfile) (5.5.35)

If you want to change version, just update this line in `Dockerfile`,

```
ENV PHP_VERSION Your_Desired_Version
```

### How to use?

Just pull it to your local machine,

```
$ docker pull petehouston/docker-alpine-php
```

### Build

The repo uses `make` to execute the command, so you can either use `make` to build or manually issue the commands.

The build commands are listed below:

* `make php-5.5`: to build image for PHP 5.5.
* `make php-5.6`: to build image for PHP 5.6.
* `make php-7.0`: to build image for PHP 7.0.
* `make build`: to build images for all PHP versions.
* `make test`: to execute image tests.
* `make all` or `make`: to execute `build` and `test`
* `make clean`: to remove all images.

### Testing

The test suite is very simple and put in a single test script [tests/index.sh](tests/index.sh).

### Notes

Please share your words if any. Always welcome :)
