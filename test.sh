#!/bin/bash
for (( c=1; c<=500; c++ ))
do
   echo "Welcome $c times"
   curl -X POST -d 'json={"json":"dd", "index": "$c dsdsds", "ssss": "$c ssssssss" }' http://localhost:8888/elasticsearch.test
done
