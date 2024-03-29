#!/bin/bash
docker run --name zaptest -t owasp/zap2docker-stable zap-baseline.py -t http://ergastapp.bienlab.com/api/f1 > /tmp/zaptest.txt
docker rm zaptest
numfail=`grep FAIL /tmp/zaptest.txt | wc -l`
numfail=`expr $numfail - 1`
cat /tmp/zaptest.txt
rm /tmp/zaptest.txt
exit $numfail
# if no fail then exit 0, else --> not pass the security test

