#!/bin/bash
docker-compose up -d && docker-compose exec -u www-data htcondor nohup bash -c "python -u /home/www-data/recibe.py > /home/www-data/recibe.out &"
