#!/bin/bash
cd ./initdb/
PATH=$PATH:/usr/local/bin
export PATH

kubectl delete pod importdb
kubectl run  importdb --image=biennt/importdb --restart=Never
fn=0
while [ $fn -ne 1 ]
do
 result=`kubectl get pod | grep importdb | grep Completed | wc -l`
 if [ $result -eq 1 ]
then
 fn=1
fi
done
kubectl logs importdb 

