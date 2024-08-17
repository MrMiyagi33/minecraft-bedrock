#!/bin/bash
export LD_LIBRARY_PATH=.

srvName="$1"
echo $srvName
gMode="$2"
echo $gMode
dif="$3"
echo $dif
allow="$4"
echo $allow
sPort="$5"
echo $sPort
sPort6="$6"
echo $sPort6
name="$7"
echo $name
seed="$8"
echo $seed
serverCore="$9"
echo $serverCore

echo 'starting replacement of properties'

sed -i -e "s/\(^server-name=\).*/\1$srvName/" \
-e "s/\(^gamemode=\).*/\1$gMode/" \
-e "s/\(^difficulty=\).*/\1$dif/" \
-e "s/\(^allow-list=\).*/\1$allow/" \
-e "s/\(^server-port=\).*/\1$sPort/" \
-e "s/\(^server-portv6=\).*/\1$sPort6/" \
-e "s/\(^level-name=\).*/\1$name/" \
-e "s/\(^level-seed=\).*/\1$seed/" server.properties

echo 'replacement complete'