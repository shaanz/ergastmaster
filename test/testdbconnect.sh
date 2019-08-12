#!/bin/bash
#wait for the app start
fn=0
while [ $fn -ne 1 ]
do
result=`/usr/local/bin/kubectl get pod | grep ergastapp | grep Running | wc -l`
  if [ $result -gt 1 ]
  then
   fn=1
  fi
done

result=`curl -i -s http://ergastapp.bienlab.com/api/f1.json | grep "Unable to select database" | wc -l`
if [ $result -gt 0 ]
then
echo 'The app said "Unable to select database"'
exit 1
else
exit 0
fi

