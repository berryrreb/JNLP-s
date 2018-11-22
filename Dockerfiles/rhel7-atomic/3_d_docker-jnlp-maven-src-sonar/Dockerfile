FROM dockeregistry.amovildigitalops.com/rh7-atomic-docker-jnlp-slave
MAINTAINER Path patricio@amxiniciativas.com
LABEL Description="CS MSA docker builder" Vendor="Dragoon MSA" Version="1.0"
USER root
# Bugfix: always add devtoolset-3 to PATH

RUN curl https://repos.amxdigital.net/rhel-server-rhscl-7-rpms.repo  -o /etc/yum.repos.d/rhel-server-rhscl-7-rpms.repo
RUN microdnf install rh-maven35
RUN microdnf install tar gzip \
    && curl https://repos.amxdigital.net/jdk-8u181-linux-x64.tar.gz -o jdk-8u181-linux-x64.tar.gz \
    && tar xzf jdk-8u181-linux-x64.tar.gz -C /opt \
    && microdnf remove tar gzip
ENV PATH="/opt/rh/rh-maven35/root/usr/bin:${PATH:-/bin:/usr/bin}"   \
    MANPATH="/opt/rh/rh-maven35/root/usr/share/man:${MANPATH}"  \
    PYTHONPATH="/opt/rh/rh-maven35/root/usr/lib/python2.7/site-packages${PYTHONPATH:+:}${PYTHONPATH:-}" \
    JAVACONFDIRS="/opt/rh/rh-maven35/root/etc/java${JAVACONFDIRS:+:}${JAVACONFDIRS:-}"  \
    XDG_CONFIG_DIRS="/opt/rh/rh-maven35/root/etc/xdg:${XDG_CONFIG_DIRS:-/etc/xdg}"  \
    XDG_DATA_DIRS="/opt/rh/rh-maven35/root/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}" 
RUN curl https://repos.amxdigital.net/sonar-scanner-cli-3.2.0.1227.zip -o /opt/sonar-scanner-cli-3.2.0.1227.zip && cd /opt && jar xf sonar-scanner-cli-3.2.0.1227.zip \
    && rm -f sonar-scanner-cli-3.2.0.1227.zip 
RUN mkdir /workspace && chown jenkins /workspace /tmp
USER jenkins
ENTRYPOINT ["jenkins-slave"]
