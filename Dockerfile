FROM ubuntu:trusty

# This file only supports the version to which a configuration exsist (as of this writing 1.4 and 1.7)
ENV VERSION 1.7
ENV ACCEPT_ORACLE_LICENSE false
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install wget -y

# Add elasticsearch repo
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo "deb http://packages.elastic.co/elasticsearch/${VERSION}/debian stable main" > /etc/apt/sources.list.d/elasticsearch-${VERSION}.list

# Add oracle java repo
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list

RUN apt-get update && apt-get install elasticsearch -y

ADD config/elasticsearch_${VERSION}.yml /etc/elasticsearch/elasticsearch.yml
ADD install.sh /opt/install.sh

# optional: install oracle java if license was accepted
RUN /opt/install.sh

EXPOSE 9200
CMD ["/usr/share/elasticsearch/bin/elasticsearch"]
