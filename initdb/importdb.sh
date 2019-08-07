#!/bin/bash
pwd
mysql -uroot -pf1 -hmysql << EOF
CREATE DATABASE ergastdb;
<< EOF
gunzip f1db.sql.gz
mysql -uroot -pf1 -hmysql ergastdb < f1db.sql
