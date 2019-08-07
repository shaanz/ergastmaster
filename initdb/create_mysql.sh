#!/bin/bash
cd ./initdb/
PATH=$PATH:/usr/local/bin
export PATH

echo "create mysql-pv-volume"
kubectl create -f mysql-pv.yaml
kubectl get pv

echo "create mysql-pv-claim"
kubectl create -f mysql-pvc.yaml
kubectl get pvc

echo "create mysql deployment"
kubectl create -f mysql-deployment.yaml
kubectl get deploy

echo "create mysql service"
kubectl create -f mysql-service.yaml

