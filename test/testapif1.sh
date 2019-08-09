#!/bin/bash
curl -i -s http://ergastapp.bienlab.com/api/f1.json > /tmp/testapif1.txt
result=`grep /tmp/testapif1.txt 200 | wc -l`
if [ $result -gt 0 ]
then
exit 0
else
exit 1
fi
cat /tmp/testapif1.txt
rm  /tmp/testapif1.txt

