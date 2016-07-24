FROM flux159/java
MAINTAINER Suyog Sonwalkar

# Install elastic search
ENV ES_VERSION 5.0.0-alpha4
ENV ES_JAVA_OPTS "-Xms1g -Xmx1g"

# See https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-configuration.html
# Virtual Memory
RUN sysctl -w vm.max_map_count=262144

# Create user
RUN adduser elasticsearch

USER elasticsearch

# Download, unarchive elasticsearch
RUN \
  cd /home/elasticsearch && \
  wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ES_VERSION/elasticsearch-$ES_VERSION.tar.gz && \
  tar xvzf elasticsearch-$ES_VERSION.tar.gz && \
  rm -f elasticsearch-$ES_VERSION.tar.gz && \
  mv elasticsearch-$ES_VERSION /home/elasticsearch/elasticsearch
  
# Mount elasticsearch.yml config
# TODO: Make ports configurable by runtime commandline args
ADD config/elasticsearch.yml /home/elasticsearch/elasticsearch/config/elasticsearch.yml

WORKDIR /home/elasticsearch

RUN mkdir -p /home/elasticsearch/data/{data,log,plugins,work}

# Define default command.
CMD ["/bin/bash","-c","/home/elasticsearch/elasticsearch/bin/elasticsearch"]

# Expose ports
EXPOSE 9200
EXPOSE 9300
