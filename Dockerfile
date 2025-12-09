FROM ubuntu

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

RUN apt-get update && apt-get install -y \
    unzip \
    wget \
    jq \
    curl \
    libcurl4t64 \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN MC_VERSION=$(wget -qO- https://net-secondary.web.minecraft-services.net/api/v1.0/download/links | jq -r '.result.links[] | select(.downloadType=="serverBedrockWindows") | .downloadUrl') \ 
    && echo $MC_VERSION \
    && wget --user-agent "mrmiyagi33/minecraft-server-bedrock" -O bedrock.zip $MC_VERSION \
    && unzip bedrock.zip \
    && rm bedrock.zip

RUN wget https://raw.githubusercontent.com/MrMiyagi33/minecraft-bedrock/main/setProperties.sh \
    && wget -O allowlist.json https://raw.githubusercontent.com/MrMiyagi33/minecraft-bedrock/main/allowlist.json \
    && wget -O permissions.json https://raw.githubusercontent.com/MrMiyagi33/minecraft-bedrock/main/permissions.json \
    && echo "eula=true" > eula.txt \
    && chmod +x setProperties.sh

ENTRYPOINT sh setProperties.sh "$SERVER_NAME" "$GAME_MODE" "$DIFFICULTY" "$ALLOW_LIST" "$SERVER_PORT" "$SERVER_PORTV6" "$LEVEL_NAME" "$LEVEL_SEED"
