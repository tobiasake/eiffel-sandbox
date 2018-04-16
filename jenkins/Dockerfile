FROM jenkins/jenkins:lts
MAINTAINER Michael Frick <michael.frick@ericsson.com>
ARG FEM_PLUGIN_VERSION
RUN echo ${FEM_PLUGIN_VERSION}
#get rid of admin password setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
EXPOSE 8080
USER root
# Install pre-defined Jenkins jobs

RUN mkdir -p /var/jenkins_home/jobs/event-triggered-job
COPY event-triggered-job.xml /var/jenkins_home/jobs/event-triggered-job/config.xml
RUN mkdir -p /var/jenkins_home/jobs/ei-artifact-triggered-job
COPY ei-artifact-triggered-job.xml /var/jenkins_home/jobs/ei-artifact-triggered-job/config.xml
RUN mkdir -p /var/jenkins_home/jobs/ei-sourcechange-triggered-job
COPY ei-sourcechange-triggered-job.xml /var/jenkins_home/jobs/ei-sourcechange-triggered-job/config.xml
RUN mkdir -p /var/jenkins_home/jobs/ei-testexecution-triggered-job
COPY ei-testexecution-triggered-job.xml /var/jenkins_home/jobs/ei-testexecution-triggered-job/config.xml
RUN mkdir -p /var/jenkins_home/jobs/upload_artifact_to_arm_curl
COPY upload_artifact_to_arm_curl.xml /var/jenkins_home/jobs/upload_artifact_to_arm_curl/config.xml
RUN mkdir -p /var/jenkins_home/jobs/send_eiffel2_event
COPY send_eiffel2_event.xml /var/jenkins_home/jobs/send_eiffel2_event/config.xml
RUN mkdir -p /var/jenkins_home/jobs/ei-artifact-triggered-parameterized-job
COPY ei-artifact-triggered-parameterized-job.xml /var/jenkins_home/jobs/ei-artifact-triggered-parameterized-job/config.xml

# Install FEM plugin
# Copy configuration file for FEM plugin
COPY com.ericsson.eiffel.fem.config.EiffelJenkinsGlobalConfiguration.xml /var/jenkins_home/com.ericsson.eiffel.fem.config.EiffelJenkinsGlobalConfiguration.xml
# Download Fem plugin
ADD https://eiffel.lmera.ericsson.se/nexus/content/repositories/releases/com/ericsson/eiffel/eiffel-fem/${FEM_PLUGIN_VERSION}/eiffel-fem-${FEM_PLUGIN_VERSION}.hpi /usr/share/jenkins/ref/plugins/eiffel-fem-${FEM_PLUGIN_VERSION}.hpi
RUN chmod 777 /usr/share/jenkins/ref/plugins/eiffel-fem-${FEM_PLUGIN_VERSION}.hpi
# Installing specified plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

