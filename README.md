# Install Atlassian (PostgreSQL, Jira)

## Build
	sudo docker build -t ugoarangino/atlassian-jira:6.3.4 jira

## Run
	sudo docker run --name postgres -d postgres
	sudo docker run --name jira --link postgres:postgres -p 8080:8080 -d ugoarangino/atlassian-jira:6.3.4

## Initialise DB
	cat initialise_db.sh | sudo docker run --rm -i --link postgres:db postgres bash -

### Docker containers
	sudo docker ps

### Docker IP´s
	sudo docker inspect -f '{{ .Config.Hostname }} {{ .Config.Image }} {{ .NetworkSettings.IPAddress }}' postgres jira

## Backup
	sudo docker run --rm --volumes-from jira -v $(pwd):/backup busybox tar cvf /backup/atlassian.tar /var/atlassian/
