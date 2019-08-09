#!/bin/bash
set -m
unitd --no-daemon --control unix:/var/run/control.unit.sock &

curl -X PUT -d @config.json --unix-socket /var/run/control.unit.sock http://localhost/config

fg %1

