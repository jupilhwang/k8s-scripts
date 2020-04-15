#!/bin/bash

CPU=$1
if [ -z $CPU ]; then 
	echo "cpu cpu cpu"
	exit 1
fi

kubectl -n ns-stateless patch hpa frontend -p '{"spec":{"targetCPUUtilizationPercentage": 10}}'

