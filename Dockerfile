From tomcat:9.0.35
MAINTAINER: vinay
COPY: /home/ansible/*.war /usr/local/tomcat/webapps/
EXPOSE: 8090
CMD [ "catalina.sh" "run" ]
