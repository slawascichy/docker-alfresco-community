#!/bin/bash

export VOLUME_BASE_DIR=/cygdrive/d/mercury/alfresco

rm -rf $VOLUME_BASE_DIR/tomcat/lib/*
rm -rf $VOLUME_BASE_DIR/tomcat/alf_data/*
rm -rf $VOLUME_BASE_DIR/tomcat/logs/*
rm -rf $VOLUME_BASE_DIR/activemq/conf/*
rm -rf $VOLUME_BASE_DIR/activemq/data/*
rm -rf $VOLUME_BASE_DIR/activemq/logs/*
rm -rf $VOLUME_BASE_DIR/search-services/keystores/*
rm -rf $VOLUME_BASE_DIR/search-services/data/*
rm -rf $VOLUME_BASE_DIR/search-services/solrhome/*
