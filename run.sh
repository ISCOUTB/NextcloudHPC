#!/bin/bash
dot="$(cd "$(dirname "$0")"; pwd)"
path1="$dot/temp/condorsubmit"
path2="$path1/vendor"
path3="$dot/nextcloud/custom_apps/condorsubmit"

if [ ! -d $path1 ]
then
    git clone https://github.com/anheru88/condorsubmit.git temp/condorsubmit
fi

if [ ! -d $path2 ]
then
    (cd $path1 && composer install)
fi

docker-compose up -d

sleep 10s
docker-compose exec -u www-data htcondor nohup bash -c "python -u /home/www-data/recibe.py > /home/www-data/recibe.out &"

if [ ! -d $path3 ]
then
    (cp -r "$dot/temp/condorsubmit" $path3)
fi