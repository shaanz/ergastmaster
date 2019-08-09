#!/bin/bash
result=`curl -i -s http://ergastapp.bienlab.com/api/f1.json | grep "Unable to select database" | wc -l`
if [ $result -gt 0 ]
then
exit 1
else
exit 0
fi

