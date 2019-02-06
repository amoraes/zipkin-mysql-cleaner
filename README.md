# Zipkin Mysql cleaner
Zipkin Mysql Cleaner helps to clean old data from a Zipkin Mysql database.

It is composed by a docker image that can be run as a daemon, and it will erase
any trace and span data older than the defined threshold.
## How to use

Set the following environment variables:
* MYSQL_HOST
* MYSQL_PORT`
* MYSQL_DATABASE
* MYSQL_USERNAME
* MYSQL_PASSWORD
* THRESHOLD

Threshold examples:
- 7d deletes anything older than 7 days
- 2h deletes anything older than 2 hours
- 5m deletes anything older than 5 minutes
