FROM dockeregistry.amovildigitalops.com/rh7-atomic-docker-jnlp-slave
MAINTAINER Path patricio@amxiniciativas.com
LABEL Description="CS MSA builder" Vendor="Dragoon MSA" Version="1.0"
USER root

ENV PATH=/opt/rh/rh-nodejs6/root/usr/bin:/opt/rh/rh-ruby25/root/usr/local/bin:/opt/rh/rh-ruby25/root/usr/bin:/opt/rh/php54/root/usr/bin:/opt/rh/php54/root/usr/sbin${PATH:+:${PATH}} \
    LD_LIBRARY_PATH=/opt/rh/rh-nodejs6/root/usr/lib64:/opt/rh/rh-ruby25/root/usr/local/lib64:/opt/rh/rh-ruby25/root/usr/lib64:/opt/rh/devtoolset-3/root/usr/lib64/:+:${LD_LIBRARY_PATH}} \
    PKG_CONFIG_PATH=/opt/rh/rh-ruby25/root/usr/local/lib64/pkgconfig:/opt/rh/rh-ruby25/root/usr/lib64/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}} \
    XDG_DATA_DIRS=/opt/rh/rh-ruby25/root/usr/local/share:/opt/rh/rh-ruby25/root/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share} \
    PYTHONPATH=/opt/rh/rh-nodejs6/root/usr/lib/python2.7/site-packages:/opt/rh/rh-nodejs6/root/usr/lib/python2.7/site-packages${PYTHONPATH:+:${PYTHONPATH}} 

RUN curl https://repos.amxdigital.net/rhel-server-rhscl-7-rpms.repo  -o /etc/yum.repos.d/rhel-server-rhscl-7-rpms.repo && curl https://repos.amxdigital.net/rhel-7-server-rpms.repo -o /etc/yum.repos.d/rhel-7-server-rpms.repo

RUN microdnf install git ant php54 php54-php-pdo php54-php-mbstring php54-php-bcmath php54-php-pecl-memcache php54-php-cli php54-php-xml php54-php-common php54-php-soap php54-php-gd 
RUN curl https://repos.amxdigital.net/sonar-scanner-cli-3.2.0.1227.zip -o /opt/sonar-scanner-cli-3.2.0.1227.zip && cd /opt && jar xf sonar-scanner-cli-3.2.0.1227.zip \
    && rm -f sonar-scanner-cli-3.2.0.1227.zip 

RUN microdnf install rh-ruby25-rubygems  && \
    microdnf install rh-ruby25-ruby-devel gcc make && \
    source /opt/rh/rh-ruby25/enable && \
    gem install compass && microdnf remove gcc make

RUN microdnf install rh-nodejs6-npm

RUN mkdir /workspace && chown jenkins /workspace /tmp && chmod +x /opt/sonar-scanner-3.2.0.1227/bin/sonar-scanner

USER jenkins

ENTRYPOINT ["jenkins-slave"]
