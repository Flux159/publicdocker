FROM ubuntu:14.04
MAINTAINER Suyog Sonwalkar

# Common dev items, curl, wget, jq (1.4), ntp
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y software-properties-common
RUN apt-get install ntp wget curl jq/trusty-backports -y

CMD ["/bin/bash"]
