#!/usr/bin/env bash

/kibana.sh &

set -e

if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data
	set -- gosu elasticsearch "$@"
fi

exec "$@"
