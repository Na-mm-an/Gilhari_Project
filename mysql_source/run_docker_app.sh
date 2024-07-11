#!/bin/bash
# run_docker_app.sh
# Conversion of run_docker_app.cmd to a shell script.

docker run  -p 80:8081 mysql_source:1.0
