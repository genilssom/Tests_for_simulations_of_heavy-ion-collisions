#!/usr/bin/env bash

# This script automates the building and running of a Docker container.

docker build --no-cache -t genilsoon/test6:v6 .
docker push genilsoon/test6:v6

