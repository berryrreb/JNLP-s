#!/bin/bash

docker push dockeregistry.amovildigitalops.com/docker-jnlp-maven-src-sonar
docker rmi $(docker images -qa -f "dangling=true")
