# docker-scaleway-cli

[![CircleCI](https://circleci.com/gh/aegirops/docker-scaleway-cli.svg?style=svg)](https://circleci.com/gh/aegirops/docker-scaleway-cli)

## Description

Docker with scaleway cli and kubectl for CI/CD purpose

This image is based on debian buster slim and contains:

- Scaleway cli
- Python 3.7
- Kubectl
- Curl
- Git
- Docker cli
- Jq
- ytt
- postgresql-client-11
- mariadb-client-10.3
- nslookup

This image is intended to be used in a scw CI/CD environment.

## DockerHub

Available publicly on:

- https://hub.docker.com/r/aegirops/scaleway-cli
