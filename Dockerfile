# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
#
# This image is intended to be used as a daemon to clean the Zipkin Mysql storage,
# for example to keep only the traces from the last 7 days.
#
# Set the following environment variables:
# MYSQL_HOST
# MYSQL_PORT
# MYSQL_DATABASE
# MYSQL_USERNAME
# MYSQL_PASSWORD
# THRESHOLD
#
# Threshold examples:
# 7d deletes anything older than 7 days
# 2h deletes anything older than 2 hours
# 5m deletes anything older than 5 minutes
#
FROM alpine:3.9
RUN /bin/sh -c "apk add --no-cache mysql-client"
RUN /bin/sh -c "apk add --no-cache dos2unix"
RUN /bin/sh -c "apk add --no-cache dateutils"
COPY entrypoint.sh entrypoint.sh
RUN dos2unix /entrypoint.sh
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]