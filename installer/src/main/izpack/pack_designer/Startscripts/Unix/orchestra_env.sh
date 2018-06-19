#!/bin/sh

# --------  adjust these values
ORC_JAVA_HOME=/usr/lib/java/jre1.6.0_04
# ORC_JAVA_HOME=/usr/lib/java/jre1.7.x
ORC_TOMCAT=/opt/apache-tomcat-5.5.26
ORC_HOME=$ORC_TOMCAT/webapps/orchestra
# -------- 

ORC_JAVA_EXEC=$ORC_JAVA_HOME/bin/java
ORC_HOME_WEBINF=$ORC_HOME/WEB-INF

