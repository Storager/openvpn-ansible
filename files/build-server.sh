#!/bin/sh
OPENVPN=/etc/openvpn
EASY_RSA=${OPENVPN}/easy-rsa
KEY_DIR=${EASY_RSA}/keys
OPENSSL=/usr/bin/openssl

$OPENSSL dhparam -out ${OPENVPN}/dh2048.pem 2048
cd $EASY_RSA
. $EASY_RSA/vars


touch "$KEY_DIR/index.txt"
echo 01 >"$KEY_DIR/serial"

$EASY_RSA/pkitool --initca && \
$EASY_RSA/pkitool --server server && \

$EASY_RSA/pkitool client

cp $KEY_DIR/server.crt $OPENVPN
cp $KEY_DIR/server.key $OPENVPN
cp $KEY_DIR/ca.crt $OPENVPN
