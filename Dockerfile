FROM ubuntu:24.10

ENV DEBIAN_FRONTEND=noninteractive

VOLUME [ "/minecraft" ]

WORKDIR /minecraft

ARG SERVER_NAME
ARG GAME_MODE
ARG DIFFICULTY
ARG ALLOW_LIST
ARG SERVER_PORT
ARG SERVER_PORTV6
ARG LEVEL_NAME
ARG LEVEL_SEED

ENV RUN_PROPERTY_SCRIPT="sh setProperties.sh ${SERVER_NAME} ${GAME_MODE} ${DIFFICULTY} ${ALLOW_LIST} ${SERVER_PORT} ${SERVER_PORTV6} ${LEVEL_NAME} ${LEVEL_SEED}"

RUN apt-get update && apt-get install -y \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O bedrock.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.20.03.zip \
    && unzip bedrock.zip \
    && rm bedrock.zip

RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT [ "LD_LIBRARY_PATH=." ]

CMD ["$RUN_PROPERTY_SCRIPT","./bedrock_server"]