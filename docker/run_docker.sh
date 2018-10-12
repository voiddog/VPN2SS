#!/bin/bash
# server list: japan_tokyo_1_udp.ovpn, usa_los_angeles_3_udp.ovpn

SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
echo $SHELL_FOLDER

# run docker
docker run -it --rm \
--name=vpn-app \
--device=/dev/net/tun \
-p 8388:8388 \
--mount type=bind,source=$SHELL_FOLDER/vpnapp,target=/vpnapp \
--cap-add NET_ADMIN \
ubuntu:vpn2ss /bin/bash /vpnapp/run_ss.sh