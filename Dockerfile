# Ethereum playground for private networks
#
FROM immutability/go-ethereum

MAINTAINER Jeff Ploughman <j.j.ploughman@gmail.com>

ENV GEN_NONCE="0xeddeadbadeeddead" \
    DATA_DIR="/root/.ethereum" \
    CHAIN_TYPE="private" \
    RUN_BOOTNODE=false \
    GEN_CHAIN_ID=1977 \
    BOOTNODE_URL=""

WORKDIR /opt

ENV GOPATH /opt/go:$GOPATH

# This is a development build so we install delve. This means we can't use this for production
RUN go get github.com/derekparker/delve/cmd/dlv
ENV PATH /opt/go/bin:/opt/go/src/local/go-ethereum/build/bin:$PATH

# bootnode port
EXPOSE 30301
EXPOSE 30301/udp

ADD src/* /opt/
RUN chmod +x /opt/*.sh

ENTRYPOINT ["/opt/startgeth.sh"]
