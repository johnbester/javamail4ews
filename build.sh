#!/bin/bash

DIR=`dirname "$0"`
DIR=`realpath "$DIR"`
cd "$DIR"
#export JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-amd64"
mvn compile package install
if [ $? -eq 0 ] ; then
  echo "Deploying jar..."
  cp target/javamail4ews.jar ../MDS/Administrator/Libraries/
  cp target/javamail4ews.jar ../MDS/Quidity-Controls/Libraries/
  cp target/javamail4ews.jar /data/data/quidity/customer/lib/
  cp target/javamail4ews.jar ../jetty/webapps/Administrator/WEB-INF/lib/
  #mvn install:install-file -Dfile=c:\kaptcha-{version}.jar -DgroupId=com.google.code -DartifactI: -Dversion={version} -Dpackaging=jar
  echo "Done."
  sleep 2
else
 echo "Build failed."
 sleep 2
 exit 1
fi
