# docker-scaleway-cli

[![CircleCI](https://circleci.com/gh/aegirops/docker-scaleway-cli.svg?style=svg)](https://circleci.com/gh/aegirops/docker-scaleway-cli)

## Description

Docker with scaleway cli and kubectl for CI/CD purpose

This image is based on debian bullseye-slim and contains:

- Scaleway cli v2.16.1
- s3cmd (python package to interact with scaleway s3 buckets)
- Python 3.9
- Kubectl
- Curl
- Git
- Docker cli
- Jq
- ytt 0.40
- postgresql-client-15
- mariadb-client-15.1
- nslookup

This image is intended to be used in a scw CI/CD environment.

## DockerHub

Available publicly on:

- https://hub.docker.com/r/aegirops/scaleway-cli
