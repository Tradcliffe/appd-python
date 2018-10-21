For any questions on the app, this is a clone from Docker Samples please read the docker git repo
https://github.com/dockersamples/docker-pets

Example of how to add AppDynamics Python Agent to a Python Flask App

If you want to set Node Name, /web/appd/start.sh script sets the AppDynamics Node name to the first 12 characters of the containerid.  

clone this repo; modify /web/appd/appdynamics.cfg to setup your agent environment variables and if you want to over write any variables at runtime you can modify the following file /web/docker.env

Build image docker build -t appd/pypet:2.0 .

Run Image docker container run -p 8080:8080 -d --name appd-pypet --env-file docker.env appd/pypet:2.0

If you need to inspect the logs, docker logs {containerid}
