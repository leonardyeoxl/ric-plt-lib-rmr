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
cp /usr/local/bin/health_ck health_ck
cp /usr/local/bin/rmr_probe rmr_probe
cp /usr/local/lib/libnng.so.1.1.0 libnng.so.1.1.0
cp /usr/local/lib/libnng.so.1 libnng.so.1
cp /usr/local/lib/libnng.so libnng.so

make sender
make receiver