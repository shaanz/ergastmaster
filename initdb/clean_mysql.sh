#!/bin/bash
cd ./initdb/
PATH=$PATH:/usr/local/bin
export PATH
echo "deleting mysql service on k8s cluster"
kubectl delete service mysql
kubectl get svc

echo "deleting mysql deployment"
kubectl delete deployment mysql
kubectl get deploy

echo "deleting mysql-pv-claim"
kubectl delete pvc mysql-pv-claim
kubectl get pvc

echo "deleting mysql-pv-volume"
kubectl delete pv mysql-pv-volume
kubectl get pv

