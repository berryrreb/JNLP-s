# Jenkins Slaves Generators

## Introduction

Jenkins's slaves aim to allow "compile" (build) code inside a DOCKER container from Jenkins.
This allows that at the end of the process we have built files and from there to be able to use those files, through Dockerfile, to make Docker images (completely containerized).


## Code Samples

The Jenkins slaves are images, based on Openjdk 8, which when instantiated by Jenkins (always instanced by Jenkins and never by the user) allows Jenkins to execute commands (shell scripts) inside the container.

The construction stack of the Jenkins slaves is as follows (in strict order of creation):

>1.- OpenJDK 8 (openjdk-jdk8): provides the necessary libraries.

>2.- jenkins / slave: creates the image that allows Jenkins to execute commands inside the container.

>3.- jenkins / jnlp-slave: creates the image that allows communication between Jenkins and the host server using the jnlp protocol

On the jenkins / jnlp-slave image, the custom project construction image is built. In this new image, each and every one of the libraries necessary to compile the project are added.

It is important to note that if it is not possible to use the JNLP protocol, you can build on the jenkins / slave image the Jenkins image that uses SSH instead of JNLP. We discourage this action.

>NOTE: The jenkins / jnlp-slave image can not be instantiated by the user from the Dockerhost. It must always be launched, created and managed by Jenkins.

## Installation

Note: All the images are based in CENTOS:7, this implies that the yum repositories are @ internet and not inside the Tirara's cloud. So, the step zero is to identify the httpproxy of the DCV where the images will be built.

>> 0.- Identify the http proxy for the DCV where the Docker images where be built.

>> 1.- Copy all the files needed by Docker to create the image to the Dockerhost where the image will be built. NOTE: by desing, the files should be coppied to the "/opt/Dockerfiles/~image directory~" 

>> 2.- Go to the directory where the "Dockerfile" is located.  

>> 3.- Run the command "docker build" as follows:

>>> docker build -t TAG:VERSION --build-arg http_proxy=http://HTTPPROXYIP:8080 --build-arg https_proxy=https://HTTPPROXYIP:8080 .

>>> NOTE: the last period is not a mistake. This period means that you are building a docker image inside the current directory.

>> 4.- Wait until the process finish.

### Installation Example

For this example we are going to use the data of Maverick's Gateway project and the construction of the jenkins-jnlp-maverickscreator (the Jenkins Slave that uses the JNLP protocol with all the libraries needed by the project)

> 0.- HTTPPROXY IP: 172.26.202.4

> 1.- 

>> 1.1.- Create the directory: /opt/Dockerfiles/jenkins-jnlp-maverickscreator

>> 1.2.- Copy all the files needed by the Dockerfile to the directory /opt/Dockerfiles/jenkins-jnlp-maverickscreator

> 2.- cd /opt/Dockerfiles/jenkins-jnlp-maverickscreator

> 3.- docker build -t jenkins/slave:3.16-1 --build-arg http_proxy=http://172.26.202.4:8080 --build-arg https_proxy=https://172.26.202.4:8080 .


