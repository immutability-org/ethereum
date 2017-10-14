# Ethereum playground for private networks
#
FROM ethereum/client-go

MAINTAINER Jeff Ploughman <j.j.ploughman@gmail.com>

ENV GEN_NONCE="0xeddeadbadeeddead" \
    DATA_DIR="/root/.ethereum" \
    CHAIN_TYPE="private" \
    RUN_BOOTNODE=false \
    GEN_CHAIN_ID=1977 \
    BOOTNODE_URL=""

WORKDIR /opt

# bootnode port
EXPOSE 30301
EXPOSE 30301/udp

ADD src/* /opt/
RUN chmod +x /opt/*.sh

ENTRYPOINT ["/opt/startgeth.sh"]
