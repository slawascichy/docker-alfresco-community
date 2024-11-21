# Alfresco Base Java Image
ARG DISTRIB_NAME="rockylinux"
ARG DISTRIB_MAJOR="9"
ARG IMAGE_BASE_LOCATION="docker.io/library/${DISTRIB_NAME}:${DISTRIB_MAJOR}"

FROM ${IMAGE_BASE_LOCATION} AS rhlike

ARG DISTRIB_NAME
ARG DISTRIB_MAJOR
ARG JDIST
ARG JAVA_MAJOR

ENV JAVA_HOME=/etc/alternatives/jre
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN \
  yum update -y && \
  yum install -y langpacks-en java-${JAVA_MAJOR}-openjdk-headless which procps && \
  yum clean all && rm -rf /var/cache/yum

RUN $JAVA_HOME/bin/java -version