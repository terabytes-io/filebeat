#!/bin/sh
set -e

APP_DIR=/opt/filebeat
# Render config file
cat $APP_DIR/filebeat.yml | sed "s/TOKEN/$TOKEN/" > filebeat.yml.tmp
cat filebeat.yml.tmp > $APP_DIR/filebeat.yml
rm filebeat.yml.tmp

exec "$@"
