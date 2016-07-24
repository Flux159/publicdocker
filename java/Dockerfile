FROM flux159/base
MAINTAINER Suyog Sonwalkar

# Install java8
RUN \
  add-apt-repository ppa:webupd8team/java -y && apt-get update && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  apt-get install -y oracle-java8-installer && apt-get clean
