# Install
## Install Atlassian (PostgreSQL, Jira)

### Build
	sudo docker build -t ugoarangino/atlassian-jira:latest .

### Run
Postgres

	sudo docker run --name postgres -d --restart="always" postgres

Atlassian Jira

	sudo docker run --name jira --link postgres:postgres -d --restart="always" ugoarangino/atlassian-jira

### Initialise DB
	cat initialise_db.sh | sudo docker run --rm -i --link postgres:db postgres bash -

### Docker containers
	sudo docker ps

### Docker IP´s
	sudo docker inspect -f '{{ .Config.Hostname }} {{ .Config.Image }} {{ .NetworkSettings.IPAddress }}' postgres jira

### Backup
	sudo docker run --rm --volumes-from jira -v $(pwd):/backup busybox tar cvf /backup/atlassian.tar /var/atlassian/
