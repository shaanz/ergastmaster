#!/bin/bash
result=`curl -i -s http://ergastapp.bienlab.com/api/f1.json | grep 200 | wc -l`
if [ $result -gt 0 ]
then
exit 0
else
exit 1
fi

