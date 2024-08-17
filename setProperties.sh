export LD_LIBRARY_PATH=.

srvName="$1"
gMode="$2"
dif="$3"
allow="$4"
sPort="$5"
sPort6="$6"
name="$7"
seed="$8"

sed -i -e "s/\(^server-name=\).*/\1$srvName/" \
-e "s/\(^gamemode=\).*/\1$gMode/" \
-e "s/\(^difficulty=\).*/\1$dif/" \
-e "s/\(^allow-list=\).*/\1$allow/" \
-e "s/\(^server-port=\).*/\1$sPort/" \
-e "s/\(^server-portv6=\).*/\1$sPort6/" \
-e "s/\(^level-name=\).*/\1$name/" \
-e "s/\(^level-seed=\).*/\1$seed/" server.properties