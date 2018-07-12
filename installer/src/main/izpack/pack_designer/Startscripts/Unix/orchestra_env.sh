#!/bin/sh

# --------  adjust these values
ORC_JAVA_HOME=%JRE_PATH
# ORC_JAVA_HOME=/usr/lib/java/jre1.7.x
ORC_TOMCAT=%TOMCAT_HOME
ORC_HOME=$ORC_TOMCAT/webapps/orchestra
# -------- 

ORC_JAVA_EXEC=$ORC_JAVA_HOME/bin/java
ORC_HOME_WEBINF=$ORC_HOME/WEB-INF

