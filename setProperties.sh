srvName=$1
gMode=$2
dif=$3
allow=$4
sPort=$5
sPort6=$6
name=$7
seed=$8

sed -i -e "s/\(^server-name=\).*/\1$1/" \
-e "s/\(^gamemode=\).*/\1$2/" \
-e "s/\(^difficulty=\).*/\1$3/" \
-e "s/\(^allow-list=\).*/\1$4/" \
-e "s/\(^server-port=\).*/\1$5/" \
-e "s/\(^server-portv6=\).*/\1$6/" \
-e "s/\(^level-name=\).*/\1$7/" \
-e "s/\(^level-seed=\).*/\1$8/" server.properties