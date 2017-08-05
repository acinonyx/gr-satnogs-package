cmake_minimum_required (VERSION 2.8.11 FATAL_ERROR)
project (gr-satnogs-package NONE)

file(
  COPY
  Dockerfile
  docker-compose.yml
  debian
  build.sh
  DESTINATION .
  )

# Default target
add_custom_target(
  build ALL
  COMMAND docker run --rm --privileged multiarch/qemu-user-static:register --reset
  COMMAND docker-compose build --pull --force-rm
  COMMAND docker-compose run -T --rm gr-satnogs-package /usr/local/bin/build.sh
  )

