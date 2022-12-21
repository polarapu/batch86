FROM centos:7.9.2009
MAINTAINER "Prasad"
RUN touch /opt/prasad
RUN mkdir /opt/dir1
RUN touch /opt/f1
RUN yum install git -y
RUN yum install java -y
RUN git config --global user.name "devops"
RUN git config --global user.email "devops@gmail.com"
RUN cd /opt && git clone https://github.com/polarapu/maven-project1.git
RUN mkdir /opt/tomcat
RUN yum install wget -y
RUN cd /opt/tomcat && wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz --no-check-certificate
RUN cd /opt/tomcat && tar -xvf apache-tomcat-10.0.27.tar.gz
COPY tomcat-users.xml /opt/tomcat/apache-tomcat-10.0.27/conf/
COPY context.xml /opt/tomcat/apache-tomcat-10.0.27/webapps/manager/META-INF
#ENV export JAVA_HOME=/path
#ENV export M2_HOME=/path
EXPOSE 81
ENTRYPOINT cat /opt/tomcat/apache-tomcat-10.0.27/conf/tomcat-users.xml
