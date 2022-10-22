# defines
IMAGE_NAME="ddavid-web"
VERSION=1.0.0

# if first argument is build
if [ "$1" = "build" ]; then
    # build the image
    docker build -t registry.digitalocean.com/ddavid/$IMAGE_NAME:$VERSION -t registry.digitalocean.com/ddavid/$IMAGE_NAME:latest .
    # if second argument is run
elif [ "$1" = "run" ]; then
    # run the image
    docker run --rm -it -p 3001:3001 registry.digitalocean.com/ddavid/$IMAGE_NAME:$VERSION
    # if second argument is push
elif [ "$1" = "push" ]; then
    # run the image
    docker push --all-tags registry.digitalocean.com/ddavid/$IMAGE_NAME
else
    # print usage
    echo "Usage: $0 [build|run|push]"
fi