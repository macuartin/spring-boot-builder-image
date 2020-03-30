# spring-boot-builder
FROM registry.redhat.io/rhel7:latest

USER root

# TODO: Set labels used in OpenShift to describe the builder image
LABEL maintainer="Miguel Cuartin <macuartin@gmail.com>" \
      io.k8s.description="Platform for building spring boot applications" \
      io.k8s.display-name="spring boot builder" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

# Install Java and other tools
COPY ./jdk1.8.0_171/ /usr/local/java/jdk1.8.0_171

# Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
COPY ./s2i/bin/ /usr/libexec/s2i

# Set workdir 
WORKDIR /usr/local/app/

