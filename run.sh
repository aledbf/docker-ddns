#!/usr/bin/env bash

set -eo pipefail

[[ $DEBUG ]] && set -x

if [ "$OPERATION" == "add" ];then
  UPDATE="update $OPERATION $HOST.$DOMAIN 180 A $IP"
  nsupdate -k Kdns-update-key.+157+14477.private <<EOF
server $NAME_SERVER
zone $DOMAIN
$UPDATE
show
send
EOF
exit 0
fi

if [ "$OPERATION" == "remove" ];then
  UPDATE="update delete $HOST.$DOMAIN A $IP"
nsupdate -k Kdns-update-key.+157+14477.private <<EOF
server $NAME_SERVER
zone $DOMAIN
$UPDATE
show
send
EOF
exit 0
fi

if [ "$OPERATION" == "update" ];then
nsupdate -k Kdns-update-key.+157+14477.private <<EOF
server $NAME_SERVER
zone $DOMAIN
update delete $HOST.$DOMAIN A $IP
update add $HOST.$DOMAIN 180 A $IP
show
send
EOF
  exit 0
fi
