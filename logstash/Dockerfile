FROM flux159/java
MAINTAINER Suyog Sonwalkar

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV LOGSTASH_VERSION 5.0.0-alpha4

# Create logstash user
RUN adduser logstash

USER logstash

# Install logstash
RUN \
  cd /home/logstash && \
  wget https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz && \
  tar xvzf logstash-$LOGSTASH_VERSION.tar.gz && \
  rm -f logstash-$LOGSTASH_VERSION.tar.gz && \
  mv logstash-$LOGSTASH_VERSION /home/logstash/logstash

ADD config/logstash.conf /home/logstash/logstash/config/logstash.conf

WORKDIR /home/logstash

CMD ["/bin/bash","-c","./logstash/bin/logstash -f /home/logstash/logstash/config/logstash.conf"]

EXPOSE 6122
