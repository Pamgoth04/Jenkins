#SCRIPT FOR TOMCAT 
#!/bin/bash

cd /opt
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.100/bin/apache-tomcat-9.0.100.tar.gz 
sudo tar -xvf /opt/apache-tomcat-9.0.100.tar.gz
cd /opt/apache-tomcat-9.0.100/webapps/manager/META-INF
sudo sed -i 's/"127\\.\\d+\\.\\d+\\.\\d+|::1|0:0:0:0:0:0:0:1"/".*"/g' context.xml
cd /opt/apache-tomcat-9.0.100/conf
sudo mv tomcat-users.xml tomcat-users_bkup.xml
sudo touch tomcat-users.xml
sudo echo '<?xml version="1.0" encoding="utf-8"?>
        <tomcat-users>
        <role rolename="manager-gui"/>
        <user username="tomcat" password="Tomcat" roles="manager-gui, manager-script, manager-status"/>
        </tomcat-users>' > tomcat-users.xml
sudo dnf install java-17-amazon-corretto -y
cd /opt/apache-tomcat-9.0.84/conf/
sudo sed -i 's/Connector port="8080"/Connector port="8081"/g' server.xml
sudo /opt/apache-tomcat-9.0.100/bin/startup.sh
