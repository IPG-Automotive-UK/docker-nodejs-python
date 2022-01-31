# Docker NodeJS & Python

Dockerfile for a Linux image that has NodeJS and Python installed. This is a base container for our web applications that require NodeJS and Python.

- NodeJS 16.13.0
- Python 3.8.0

## Build & push image to DockerHub

https://hub.docker.com/repository/docker/ipgautomotive/nodejs-python

We build for AMD64 and ARM64 architectures.

If this is the first time you are building this image then you will need to run this command to create a multi-arch builder.

```
docker buildx create --name ipgbuilder
```

Now you can create the builds.

```
docker buildx use ipgbuilder
docker buildx inspect --bootstrap
docker buildx build --platform linux/amd64,linux/arm64 --tag ipgautomotive/nodejs-python:latest --push .
```
