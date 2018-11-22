FROM dockeregistry.amovildigitalops.com/rh7-atomic-docker-jnlp-slave
MAINTAINER Path patricio@amxiniciativas.com
LABEL Description="CS MSA docker builder" Vendor="Dragoon MSA" Version="1.0"
USER root
# Bugfix: always add devtoolset-3 to PATH
ENV PATH=/opt/rh/rh-php70/root/usr/bin:/opt/rh/rh-php70/root/usr/sbin${PATH:+:${PATH}} \
    LD_LIBRARY_PATH=/opt/rh/devtoolset-3/root/usr/lib64/:/opt/rh/rh-php70/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}} \

RUN curl https://repos.amxdigital.net/rhel-server-rhscl-7-rpms.repo  -o /etc/yum.repos.d/rhel-server-rhscl-7-rpms.repo
RUN microdnf install docker
RUN mkdir /workspace && chown jenkins /workspace /tmp
#
USER jenkins
ENTRYPOINT ["jenkins-slave"]
