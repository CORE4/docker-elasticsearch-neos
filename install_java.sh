#!/bin/sh

if [ "$ACCEPT_ORACLE_LICENSE" = "true" ]; then
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select ${ACCEPT_ORACLE_LICENSE} | /usr/bin/debconf-set-selections
    apt-get install oracle-java8-installer oracle-java8-set-default -y
else
    echo "You need to accept the Oracle Java License to use this container."
    echo "http://www.oracle.com/technetwork/java/javase/downloads/index.html"
fi
