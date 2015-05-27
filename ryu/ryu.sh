#!/bin/bash 

set -ex

APP=${APP:-ryu.app.rest_firewall}
ARGS=""

if [[ -z $VERBOSE ]]; then
	ARGS="--verbose ${ARGS}"	
fi

ryu-manager ${ARGS} ${APP}
