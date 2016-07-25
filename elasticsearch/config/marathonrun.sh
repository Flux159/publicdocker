#!/bin/bash

# Retrieve $ESHOSTS from marathon api
# Marathon provides $HOST, $PORT0, $PORT1 environment variables
# Marathon json config (user) needs to supply $APP_ID, $CLUSTER_NAME, and $MARATHON_URL
# See example in marathonexample.json 
# marathonexample.json assumes 10.0.0.10 is a marathon master, 10.0.0.22, 10.0.0.23 are agents
export ESHOSTS=$(curl -s "$MARATHON_URL/v2/apps/$APP_ID/tasks" | jq -r '.tasks[] | (.host + ":" + (.ports[1]|tostring))' | sed ':a;N;$!ba;s/\n/,/g')

/home/elasticsearch/elasticsearch/bin/elasticsearch
