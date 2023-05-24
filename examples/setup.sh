#!/bin/bash
sudo rm sender
sudo rm receiver
sudo rm shared/route_table.rt.stash
sudo rm shared/route_table.rt.stash.inc
sudo rm shared/route_table_sender.rt.stash
sudo rm shared/route_table_sender.rt.stash.inc

cp /usr/local/lib/librmr_nng.so.3.8.2 librmr_nng.so.3.8.2
cp /usr/local/lib/librmr_nng.so.3 librmr_nng.so.3
cp /usr/local/lib/librmr_nng.so librmr_nng.so
cp /usr/local/lib/librmr_nng.a librmr_nng.a
cp /usr/local/bin/health_ck health_ck
cp /usr/local/bin/rmr_probe rmr_probe
cp /usr/local/lib/libnng.so.1.3.0-dev libnng.so.1.3.0-dev
cp /usr/local/lib/libnng.so.1.1.0 libnng.so.1.1.0
cp /usr/local/lib/libnng.so.1 libnng.so.1
cp /usr/local/lib/libnng.so libnng.so
cp /usr/local/lib/libnng.a libnng.a
cp /usr/lib/x86_64-linux-gnu/libmbedtls.so libmbedtls.so
cp /usr/lib/x86_64-linux-gnu/libmbedtls.so.12 libmbedtls.so.12
cp /usr/lib/x86_64-linux-gnu/libmbedtls.so.2.16.3 libmbedtls.so.2.16.3
cp /usr/lib/x86_64-linux-gnu/libmbedx509.so libmbedx509.so
cp /usr/lib/x86_64-linux-gnu/libmbedx509.so.0 libmbedx509.so.0
cp /usr/lib/x86_64-linux-gnu/libmbedx509.so.2.16.3 libmbedx509.so.2.16.3
cp /usr/lib/x86_64-linux-gnu/libmbedcrypto.so libmbedcrypto.so
cp /usr/lib/x86_64-linux-gnu/libmbedcrypto.so.3 libmbedcrypto.so.3
cp /usr/lib/x86_64-linux-gnu/libmbedcrypto.so.2.16.3 libmbedcrypto.so.2.16.3

make sender
make receiver