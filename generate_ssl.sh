#!/bin/bash

CERT_DIR="./docker/certs"

mkdir -p $CERT_DIR

openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" \
    -keyout $CERT_DIR/nginx.key -out $CERT_DIR/nginx.crt
    
chmod 700 $CERT_DIR
chmod 600 $CERT_DIR/nginx.key $CERT_DIR/nginx.crt
