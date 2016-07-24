FROM flux159/base
MAINTAINER Suyog Sonwalkar

ENV NODEREPO node_6.x
ENV DISTRO trusty

# Install nodejs
RUN \
  wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  apt-get install apt-transport-https -y && \
  echo "deb https://deb.nodesource.com/$NODEREPO $DISTRO main" > /etc/apt/sources.list.d/nodesource.list && \
  echo "deb-src https://deb.nodesource.com/$NODEREPO $DISTRO main" >> /etc/apt/sources.list.d/nodesource.list && \
  apt-get update && \
  apt-get install -y nodejs
