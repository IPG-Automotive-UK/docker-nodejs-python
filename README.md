# Docker NodeJS & Python

Dockerfile for a Linux image that has NodeJS and Python installed. This is a base container for our web applications that require NodeJS and Python.

- NodeJS 14.14.0
- Python 3.8.0

## Build & push image to DockerHub

We build for AMD64 and ARM64 architectures.

```
docker buildx create --name ipgbuilder
docker buildx use ipgbuilder
docker buildx inspect --bootstrap
docker buildx build --platform linux/amd64,linux/arm64 --tag ipgautomotiveuk/nodejs-python:latest --push .
```
