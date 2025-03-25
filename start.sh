#!/bin/bash
#set -x
operatorName=$1
VAR=""
if [ -z $operatorName ]
then
	echo "Please Provide operator name"
	exit 1 
fi
DPATH="/u01/eirsapp/KYC/Jar/"
PNAME="KycAutomationApplication-1.0-SNAPSHOT.jar"
cd $DPATH
status=$(ps -ef | grep $PNAME | grep java)
if [ "$status" != "$VAR" ]
then
 echo "The process is already running"
 echo $status
else
 echo "Starting process"
 java -Dlog4j.configurationFile=./log4j2.xml  -Dmodule.name=KYCDBAutomation  -Dspring.config.location=file:./application.properties,file:${commonConfigurationFile} -jar  $PNAME $operatorName
 
 #java -Dlog4j.configurationFile=file:log4j2.xml -Dmodule.name=KYCDBAutomation -jar $PNAME --operator=tnm -Dspring.config.location=file:./application.properties,file:${commonConfigurationFile} &
 echo "Process started"
fi

