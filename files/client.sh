#/bin/sh
mkdir /$USER/client
cp "/etc/openvpn/easy-rsa/keys/client.crt" /$USER/client/
cp "/etc/openvpn/easy-rsa/keys/client.key" /$USER/client/
cp "/etc/openvpn/easy-rsa/keys/ca.crt" /$USER/client/
cp "/usr/share/doc/openvpn/examples/sample-config-files/client.conf"  /$USER/client/client.ovpn

tar czvf "/$USER/client.tgz" /$USER/client
