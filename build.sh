#!/bin/bash -x

APP=helloworldapp
TAG=latest
IMAGE=thebellman/$APP:$TAG
PORT=8080

docker stop $APP
docker rm $APP

docker build -t $IMAGE .
docker rmi -f $(docker images -f dangling=true -q) 2>/dev/null

docker run -p $PORT:8080 -d --name $APP $IMAGE 
docker logs -f $APP
