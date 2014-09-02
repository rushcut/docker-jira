#!/bin/bash

echo $DB_PORT_5432_TCP_ADDR:$DB_PORT_5432_TCP_PORT

echo "
CREATE ROLE jirauser WITH LOGIN PASSWORD 'atlSQLpasw42_' VALID UNTIL 'infinity';
CREATE DATABASE jira WITH ENCODING 'UNICODE' TEMPLATE=template0;" \
| psql -h $DB_PORT_5432_TCP_ADDR -p $DB_PORT_5432_TCP_PORT -U postgres

echo "DB: jira - USR: jirauser - PWD: atlSQLpasw42_"