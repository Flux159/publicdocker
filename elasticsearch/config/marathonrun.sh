#!/bin/bash

ESHOSTS=$(curl -s \"$MARATHON_URL/v2/apps/$APP_ID/tasks\" | jq '.tasks[] | [.host + \":\" + (.ports[0]|tostring)] | join(\",\")')",
/home/elasticsearch/elasticsearch/bin/elasticsearch" && \
  --discovery.zen.minimum_master_nodes=2 && \
  --discovery.zen.ping.multicast.enabled=false && \
  --discovery.zen.ping.unicast.hosts=$ESHOSTS && \
  --discovery.zen.ping_timeout=30s && \
  --discovery.zen.join_timeout=300s && \
  --http.port=9200 && \
  --transport.tcp.port=9300 && \
  --transport.publish_port=$PORT1 && \
  --cluster.name=$CLUSTER_NAME && \
  --network.publish_host=$HOST && \
  --node.name=\"${APP_ID}-${PORT0}
