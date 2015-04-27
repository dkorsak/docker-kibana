#!/bin/bash

docker run -t -i -p 9200:9200 -p 9300:9300 -v $(pwd)/data:/data elasticsearch


curl -XPUT 'localhost:9200/customer/external/1?pretty' -d '{"name": "John Doe"}'
curl -XPUT 'localhost:9200/customer/external/2?pretty' -d '{"name": "Zenoen"}'
curl -XPUT 'localhost:9200/customer/external/3?pretty' -d '{"name": "Daniel Korsak"}'

curl -XPUT 'localhost:9200/customer?pretty'

curl -XPOST 'localhost:9200/bank/account/_bulk?pretty' --data-binary @accounts.json

curl 'localhost:9200/_cat/indices?v'

curl -XPOST 'localhost:9200/bank/_search?pretty' -d '{"query": { "match_all": {} },"size": 1}'

curl -XPOST 'localhost:9200/bank/_search?pretty' -d '{"query": { "match": { "account_number": 20 }}}'

curl -XPOST 'localhost:9200/logstash-2015.04.27/_search?pretty' -d '{"query": { "match_all": {} },"size": 1}'


curl -X POST -d 'json={"json":"message"}' http://localhost:8888/debug.test