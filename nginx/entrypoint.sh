#!/bin/bash

/docker-entrypoint.sh
filebeat modules enable nginx
filebeat setup
service filebeat start
nginx -g 'daemon off;'
entrypoint: wait-for elasticsearch:9200 -t 40 -- ./entrypoint.sh
