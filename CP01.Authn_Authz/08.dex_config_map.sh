#!/bin/bash

#kubectl config use-context mgmt-admin@mgmt
kubectl -n tanzu-system-auth get cm -o jsonpath='{.data.config\.yaml}'

