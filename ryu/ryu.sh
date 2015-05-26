#!/bin/bash 

set -ex

APP=${APP:-rest_firewall.py}
ARGS="/config/${APP}"

if [[ -z $VERBOSE ]]; then
	ARGS="--verbose ${ARGS}"	
fi

ryu-manager ${ARGS}