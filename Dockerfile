FROM ubuntu:15.04

RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# Auto-accept the Oracle JDK license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get install -y oracle-java8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get install -y wget
# Install the "summon" secrets management utility
RUN wget -O /tmp/summon_v0.4.0_linux_amd64.tar.gz https://github.com/conjurinc/summon/releases/download/v0.4.0/summon_v0.4.0_linux_amd64.tar.gz
RUN tar zxvf /tmp/summon_v0.4.0_linux_amd64.tar.gz -C /usr/local/bin

# Install the "summon-s3" secrets provider
RUN wget -O /tmp/summon-s3_v0.2.0_linux_amd64.tar.gz https://github.com/pcbng/summon-s3/releases/download/v0.2.0/summon-s3_v0.2.0_linux_amd64.tar.gz
RUN mkdir /usr/local/lib/summon
RUN tar zxvf /tmp/summon-s3_v0.2.0_linux_amd64.tar.gz -C /usr/local/lib/summon

# cleanup
RUN rm -rf /tmp/*
