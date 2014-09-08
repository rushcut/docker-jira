FROM ugoarangino/atlassian:latest
MAINTAINER Ugo Arangino <dev@ugoarangino.de>

RUN wget http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.3.4-x64.bin
RUN chmod +x atlassian-jira-6.3.4-x64.bin
RUN echo -e "\n \n \n \n \n \n \n \n" | sudo ./atlassian-jira-6.3.4-x64.bin
RUN rm atlassian-jira-6.3.4-x64.bin

WORKDIR /opt/atlassian/jira/
VOLUME /opt/atlassian/jira/
VOLUME /var/atlassian/application-data/jira/
EXPOSE 8080
USER jira
CMD /opt/atlassian/jira/bin/start-jira.sh -fg