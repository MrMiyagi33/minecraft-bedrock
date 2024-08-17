FROM ubuntu:24.10

ENV DEBIAN_FRONTEND=noninteractive

EXPOSE 19132/udp

VOLUME [ "/minecraft" ]

WORKDIR /minecraft

ENV SERVER_NAME='My_Server'
ENV GAME_MODE='survival'
ENV DIFFICULTY='normal'
ENV ALLOW_LIST='false'
ENV SERVER_PORT='19132'
ENV SERVER_PORTV6='19133'
ENV LEVEL_NAME='My_World'
ENV LEVEL_SEED=

ENV RUN_PROPERTY_SCRIPT="sh setProperties.sh '${SERVER_NAME}' '${GAME_MODE}' '${DIFFICULTY}' '${ALLOW_LIST}' '${SERVER_PORT}' '${SERVER_PORTV6}' '${LEVEL_NAME}' '${LEVEL_SEED}'"
#ENV PARAMS="{SERVER_NAME} ${GAME_MODE} ${DIFFICULTY} ${ALLOW_LIST} ${SERVER_PORT} ${SERVER_PORTV6} ${LEVEL_NAME} ${LEVEL_SEED}"

RUN apt-get update && apt-get install -y \
    unzip \
    wget \
    libcurl4 \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O bedrock.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.20.03.zip \
    && unzip bedrock.zip \
    && rm bedrock.zip

RUN wget https://raw.githubusercontent.com/MrMiyagi33/minecraft-bedrock/main/setProperties.sh \
    && wget https://raw.githubusercontent.com/MrMiyagi33/minecraft-bedrock/main/runBedrock.sh

RUN echo "eula=true" > eula.txt

RUN chmod +x setProperties.sh

#RUN ${RUN_PROPERTY_SCRIPT}

ENTRYPOINT ${RUN_PROPERTY_SCRIPT}

CMD runBedrock.sh