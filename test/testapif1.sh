#!/bin/bash
curl -i -s http://ergastapp.bienlab.com/api/f1.json > /tmp/testapif1.txt
result=`grep 200 /tmp/testapif1.txt | wc -l`
if [ $result -gt 0 ]
then
cat /tmp/testapif1.txt
rm  /tmp/testapif1.txt
exit 0
else
cat /tmp/testapif1.txt
rm  /tmp/testapif1.txt
exit 1
fi

