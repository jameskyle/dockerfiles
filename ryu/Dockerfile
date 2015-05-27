# Ryu SDN Framework
# VERSION 0.0.1

# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.16

MAINTAINER James Kyle <james@jameskyle.org>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
WORKDIR /root

RUN apt-get update
RUN apt-get install -qy --no-install-recommends python-pip \
                                                build-essential \
                                                python-dev \
                                                unzip \
                                                wget
RUN pip install --upgrade pip
RUN pip install --upgrade eventlet \
                          lxml \
                          msgpack \
                          netaddr \
                          oslo.config \
                          paramiko \
                          routes \
                          six \
                          webob





RUN wget --no-check-certificate https://github.com/osrg/ryu/archive/master.zip
RUN unzip master.zip
RUN cd ryu-master && python setup.py install

ADD ryu.sh /etc/service/ryu/run
RUN chmod +x /etc/service/ryu/run

EXPOSE 6633
EXPOSE 8080
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
