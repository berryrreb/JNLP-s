FROM  dockeregistry.amovildigitalops.com/rhel7-atomic

USER root

RUN mkdir -p etc/yum.repos.d/ etc/pki/rhui/product/
COPY etc/pki/rhui/product/content.crt /etc/pki/rhui/product/
COPY etc/pki/rhui/ca.crt /etc/pki/rhui/
COPY etc/pki/rhui/key.pem /etc/pki/rhui/
COPY etc/yum.repos.d/rhel.repo /etc/yum.repos.d/

RUN mkdir /deployments
# JAVA_APP_DIR is used by run-java.sh for finding the binaries
ENV JAVA_APP_DIR=/deployments \
    JAVA_MAJOR_VERSION=8

# /dev/urandom is used as random source, which is prefectly safe
# according to http://www.2uo.de/myths-about-urandom/
RUN microdnf install -y \
       java-1.8.0-openjdk 
ENV JAVA_HOME /etc/alternatives/jre

# Agent bond including Jolokia and jmx_exporter
ADD agent-bond-opts /opt/run-java-options
RUN mkdir -p /opt/agent-bond \
 && curl http://central.maven.org/maven2/io/fabric8/agent-bond-agent/1.2.0/agent-bond-agent-1.2.0.jar \
          -o /opt/agent-bond/agent-bond.jar \
 && chmod 444 /opt/agent-bond/agent-bond.jar \
 && chmod 755 /opt/run-java-options
ADD jmx_exporter_config.yml /opt/agent-bond/
EXPOSE 8778 9779

# Add run script as /deployments/run-java.sh and make it executable
COPY run-java.sh /deployments/
RUN chmod 755 /deployments/run-java.sh




CMD [ "/deployments/run-java.sh" ]
