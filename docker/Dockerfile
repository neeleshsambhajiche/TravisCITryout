FROM centos:7

USER root

# Install dev tools
RUN yum clean all; \
    rpm --rebuilddb; \
    yum install -y initscripts curl which tar sudo rsync openssh-server openssh-clients

#############################################################################
# Install java
RUN yum install -y java-1.8.0-openjdk
ENV JAVA_HOME=/etc/alternatives/jre

#############################################################################
# Install Scala
ARG SCALA_VERSION=2.11.12
ENV SCALA_HOME=/usr/local/scala-$SCALA_VERSION
RUN mkdir -p "${SCALA_HOME}" \
  && export SCALA_ARCHIVE=scala-$SCALA_VERSION.tgz \
  && export SCALA_DOWNLOAD_PATH=scala/$SCALA_VERSION/$SCALA_ARCHIVE \
  && curl -#SL https://downloads.lightbend.com/$SCALA_DOWNLOAD_PATH | \
    tar -xz -C $SCALA_HOME --strip-components 1 \
  && rm -rf $SCALA_ARCHIVE

ENV PATH=$PATH:$SCALA_HOME/bin

##############################################################################

RUN mkdir /Travis

COPY run-travis-tests.sh /Travis/run-travis-tests.sh
RUN chmod 777 /Travis/run-travis-tests.sh

COPY Travis*.jar /Travis/
COPY scalatest_2.11-3.0.5.jar /Travis/scalatest_2.11-3.0.5.jar
COPY scalactic_2.11-3.0.5.jar /Travis/scalactic_2.11-3.0.5.jar


