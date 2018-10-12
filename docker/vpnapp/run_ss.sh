#!/bin/bash
ovpn_config='/vpnapp/japan_tokyo_1_udp.ovpn'
ss_config='/vpnapp/ss-config.json'
user_pass_config='/vpnapp/user-pass'

while getopts "o:s:u:" arg
do
    case $arg in
        o)
            ovpn_config=$OPTARG
            ;;
        s)
            ss_config=$OPTARG
            ;;
        u)
            user_pass_config=$OPTARG
            ;;
        ?)
            echo "unknow argument"
            exit 1
            ;;
        esac
done

# update nameserver
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# start open vpn
openvpn --daemon --config $ovpn_config --auth-user-pass $user_pass_config --log /vpnapp/openvpn.log

# start shadowsocks
ss-server -c $ss_config
