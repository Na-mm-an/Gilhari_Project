#!/bin/bash
# build.sh
# Conversion of build.cmd to a shell script.

docker build -t mysql_source:1.0 .
docker images
