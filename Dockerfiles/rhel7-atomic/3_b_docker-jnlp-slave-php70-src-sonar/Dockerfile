FROM dockeregistry.amovildigitalops.com/rh7-atomic-docker-jnlp-slave
MAINTAINER Path patricio@amxiniciativas.com
LABEL Description="CS MSA builder" Vendor="Dragoon MSA" Version="1.0"
USER root
#evilseed
#docker run -it --rm -u root -e https_proxy=https://172.26.134.132:8080 -e http_proxy=http://172.26.134.132:8080 dockeregistry.amovildigitalops.com/rh7-atomic-docker-jnlp-slave bash 

#ENV PATH=/opt/rh/rh-php71/root/usr/bin:/opt/rh/rh-php71/root/usr/sbin${PATH:+:${PATH}} \
#        LD_LIBRARY_PATH=/opt/rh/rh-php71/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}} \
#        MANPATH=/opt/rh/rh-php71/root/usr/share/man:${MANPATH}

# Dont use . /opt/rh/rh-php70/enable  as is preferable to have ENV on running images

# export PATH=/opt/rh/rh-php70/root/usr/bin:/opt/rh/rh-php70/root/usr/sbin${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=/opt/rh/rh-php70/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#export MANPATH=/opt/rh/rh-php70/root/usr/share/man:${MANPATH}
#[root@php70-sanborns /]# 

ENV PATH=/opt/rh/rh-nodejs6/root/usr/bin:/opt/rh/rh-ruby25/root/usr/local/bin:/opt/rh/rh-ruby25/root/usr/bin:/opt/rh/rh-php70/root/usr/bin:/opt/rh/rh-php70/root/usr/sbin${PATH:+:${PATH}} \
    LD_LIBRARY_PATH=/opt/rh/rh-nodejs6/root/usr/lib64:/opt/rh/rh-ruby25/root/usr/local/lib64:/opt/rh/rh-ruby25/root/usr/lib64:/opt/rh/devtoolset-3/root/usr/lib64/:/opt/rh/rh-php70/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}} \
    PKG_CONFIG_PATH=/opt/rh/rh-ruby25/root/usr/local/lib64/pkgconfig:/opt/rh/rh-ruby25/root/usr/lib64/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}} \
    PYTHONPATH=/opt/rh/rh-nodejs6/root/usr/lib/python2.7/site-packages${PYTHONPATH:+:${PYTHONPATH}} \
    XDG_DATA_DIRS=/opt/rh/rh-ruby25/root/usr/local/share:/opt/rh/rh-ruby25/root/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share} \
    PYTHONPATH=/opt/rh/rh-nodejs6/root/usr/lib/python2.7/site-packages${PYTHONPATH:+:${PYTHONPATH}} 

RUN curl https://repos.amxdigital.net/rhel-server-rhscl-7-rpms.repo  -o /etc/yum.repos.d/rhel-server-rhscl-7-rpms.repo

RUN microdnf install rh-php70 git ant 
RUN microdnf install make rh-php70-php-devel gcc && pecl channel-update pecl.php.net &&  yes no | pecl install redis && microdnf remove \
                autoconf \
                automake \
                cpp \
                gcc \
                gcc kernel-headers \
                glibc-devel \
                glibc-devel \
                glibc-headers \
                kernel-headers   \
                libgomp \
                libmpc \
                m4 \
                make \
                mpfr \
                pcre-devel \
                rh-php70-php-devel
RUN microdnf install rh-php70-php-pdo rh-php70-php-soap rh-php70-php-xml 
RUN curl https://repos.amxdigital.net/sonar-scanner-cli-3.2.0.1227.zip -o /opt/sonar-scanner-cli-3.2.0.1227.zip && cd /opt && jar xf sonar-scanner-cli-3.2.0.1227.zip \
    && rm -f sonar-scanner-cli-3.2.0.1227.zip 
# ¬¬* will fat the container to the unilited ...
RUN microdnf install rh-nodejs6-npm

#RUN npm config set proxy $http_proxy && npm config set proxy-https $http_proxy && npm install -g @angular/cli
#RUN npm config delete proxy && npm config delete proxy
RUN chown -R jenkins /home/jenkins
RUN mkdir /workspace && chown jenkins /workspace /tmp && chmod +x /opt/sonar-scanner-3.2.0.1227/bin/sonar-scanner
#
USER jenkins
ENV PATH=/home/jenkins/node_modules/.bin:/opt/rh/rh-nodejs6/root/usr/bin:/opt/rh/rh-ruby25/root/usr/local/bin:/opt/rh/rh-ruby25/root/usr/bin:/opt/rh/rh-php70/root/usr/bin:/opt/rh/rh-php70/root/usr/sbin${PATH:+:${PATH}} 

ENTRYPOINT ["jenkins-slave"]
