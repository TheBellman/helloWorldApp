# node.js helloWorldApp

This is derived from https://docs.docker.com/engine/examples/nodejs_web_app/ and is intended to be a very simple app hello world that
can be used to explore clustering, deployment and networking. All it does is respond to GET requests with a statement of belief about
it's IP address.

## to build and run

    docker build -t helloworldapp .
    docker rmi -f $(docker images -f dangling=true -q) 2>/dev/null
    docker run -p 8080:8080 -d --name helloworldapp helloworldapp
    docker logs helloworldapp

## to test

this will reveal the ip address of the process from the POV of the process

    docker inspect --format '{{ .NetworkSettings.IPAddress }}' helloworldapp

and doing

    curl http://$(docker-machine ip):8080

should show the same IP address:

    $ docker inspect --format '{{ .NetworkSettings.IPAddress }}' helloworldapp
    172.17.0.2
    $ curl http://$(docker-machine ip):8080
    Hello world from 172.17.0.2

there is also a dummy health-check end point which can be used for heartbeat testing

    $ curl http://$(docker-machine ip):8080/health-check
    {"healthy": true}

## to stop

    docker stop helloworldapp
    docker rm helloworldapp
