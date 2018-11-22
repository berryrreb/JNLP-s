#!/bin/bash

docker build -t dockeregistry.amovildigitalops.com/docker-jnlp-maven-src-sonar \
        --build-arg http_proxy=http://172.26.134.132:8080 --build-arg https_proxy=https://172.26.134.132:8080 .
exit $?
