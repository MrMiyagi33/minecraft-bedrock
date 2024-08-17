#!/bin/bash
export LD_LIBRARY_PATH=.

echo "Replacement variables"

srvName="$1"
echo "server name: "$srvName
gMode="$2"
echo "game mode: "$gMode
dif="$3"
echo "difficulty: "$dif
allow="$4"
echo "allow list: "$allow
sPort="$5"
echo "portv4: "$sPort
sPort6="$6"
echo "portv6: "$sPort6
name="$7"
echo "name: "$name
seed="$8"
echo "seed: "$seed

echo 'Starting replacement of properties'

sed -i -e "s/\(^server-name=\).*/\1$srvName/" \
-e "s/\(^gamemode=\).*/\1$gMode/" \
-e "s/\(^difficulty=\).*/\1$dif/" \
-e "s/\(^allow-list=\).*/\1$allow/" \
-e "s/\(^server-port=\).*/\1$sPort/" \
-e "s/\(^server-portv6=\).*/\1$sPort6/" \
-e "s/\(^level-name=\).*/\1$name/" \
-e "s/\(^level-seed=\).*/\1$seed/" server.properties

echo 'replacement completed!'

echo 'Starting server'
./bedrock_server