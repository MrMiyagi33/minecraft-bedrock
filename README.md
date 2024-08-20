A simple minecraft bedrock with various inputs to customize the server properties.

Download the docker file here or on docker hub.

To run server via docker compose, see example below:
 ```
services:
  bedrock:
    container_name: minecraft
    image: mrmiyagi33/minecraft-server-bedrock
    environment:
      SERVER_NAME: "My Server"
      GAME_MODE: "survival"
      DIFFICULTY: "normal"
      ALLOW_LIST: "false"
      SERVER_PORT: "19132"
      SERVER_PORTV6: "19133"
      LEVEL_NAME: "My World!"
      LEVEL_SEED: "123456789" #blank generates random seed
    ports:
      - 19132:19132/udp
    volumes:
     -  minecraft_vol:/minecraft
volumes:
  minecraft_vol:
 ```
Image will download two files, allowlist.json and permissions.json.

**Allow Lists**
If ALLOW_LIST is set to "true", then you will need to populate the pre-structured allowlist.json provided in the 
containers /minecraft config directory. XUID for xbox id code and name for matching xbox user name. 

**Permissions**
If specific permissions are desired as well you will need to edit the permissions.json file
in the container's /minecraft config directory as well.

*Restart server after any server config edits*
