FROM golang:1.14 as builder

ARG version=3.0.5
ENV VERSION=$version

RUN apt-get update && \
    apt -y install \
        git gcc cmake autoconf libtool pkg-config libmnl-dev libyaml-dev

RUN go get -u github.com/sirupsen/logrus

RUN mkdir -p /tmp && cd /tmp && \
    git clone --recursive -b v$VERSION -j `nproc` https://github.com/free5gc/free5gc.git && \
    cd free5gc && \ 
    make

RUN cd /tmp/free5gc && \ 
    make upf
RUN cp /tmp/free5gc/bin/* /usr/local/bin/ && \
    cp /tmp/free5gc/NFs/upf/build/bin/free5gc-upfd /usr/local/bin/upf && \
    cp /tmp/free5gc/NFs/upf/build/config/upfcfg.yaml /etc/open5gs

RUN cp -rP /tmp/free5gc/NFs/upf/build/updk/src/third_party/libgtp5gnl/lib/libgtp5gnl.so* /usr/local/lib/ && \
    cp /tmp/free5gc/NFs/upf/build/utlt_logger/liblogger.so /usr/local/lib/


FROM debian:buster-slim

ARG version=3.0.5
ENV VERSION=$version

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    libyaml-0-2 \
    libmnl0 \
    iproute2 iputils-ping procps net-tools iptables tcpdump && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/ /usr/local/bin/
COPY --from=builder /usr/local/lib/ /lib/x86_64-linux-gnu/

COPY  config/ /etc/free5gc/
