FROM flux159/base
MAINTAINER Suyog Sonwalkar

ENV KIBANA_VERSION 5.0.0-alpha4

# Create kibana user
RUN adduser kibana

USER kibana

# Install kibana
RUN \
  cd /home/kibana && \
  wget https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz && \
  tar xvzf kibana-$KIBANA_VERSION-linux-x64.tar.gz && \
  rm -f kibana-$KIBANA_VERSION-linux-x64.tar.gz && \
  mv kibana-$KIBANA_VERSION-linux-x64 /home/kibana/kibana

# TODO: Need to make elasticsearch output configurable (possibly even setup via marathon api)
ADD config/kibana.yml /home/kibana/kibana/config/kibana.yml

WORKDIR /home/kibana

CMD ["/bin/bash","-c","./kibana/bin/kibana -H 0.0.0.0 -p 6123 -e $ESURL"]

EXPOSE 6123
