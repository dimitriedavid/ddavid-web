#!/bin/bash

# defines
IMAGE_NAME="ddavid-web"
VERSION=1.0.0

build () {
  docker build -t registry.digitalocean.com/ddavid/$IMAGE_NAME:$VERSION -t registry.digitalocean.com/ddavid/$IMAGE_NAME:latest .
}

run () {
  docker run --rm -it -p 3001:3001 registry.digitalocean.com/ddavid/$IMAGE_NAME:$VERSION
}

push () {
  docker push --all-tags registry.digitalocean.com/ddavid/$IMAGE_NAME
}

update-server () {
  ssh root@ddavid.me -t 'docker pull registry.digitalocean.com/ddavid/ddavid-web; cd ./config/ddavid-web/; docker-compose up -d --force-recreate --no-deps ddavid-web'
}

# if first argument is build
if [ "$1" = "build" ]; then
    build
elif [ "$1" = "run" ]; then
    run
elif [ "$1" = "push" ]; then
    push
elif [ "$1" = "update-server" ]; then
    update-server
elif [ "$1" = "publish" ]; then
    build
    push
    update-server    
else
    # print usage
    echo "Usage: $0 [build|run|push|update-server|publish]"
fi