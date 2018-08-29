#!/bin/bash

hostip=`ifconfig | grep 192 | awk -F 'inet |  netmask' '{print $2}'`

mkdir -p /data/fdfs
cp /etc/fdfs/tracker.conf.sample /etc/fdfs/tracker.conf
cp /etc/fdfs/storage.conf.sample /etc/fdfs/storage.conf

sed -i "s/bind_addr=/bind_addr=$hostip/g" /etc/fdfs/tracker.conf
sed -i '/base_path/s/^/#/' /etc/fdfs/tracker.conf
echo "base_path=/data/fdfs" >> /etc/fdfs/tracker.conf

sed -i "s/bind_addr=/bind_addr=$hostip/g" /etc/fdfs/storage.conf
sed -i '/base_path/s/^/#/' /etc/fdfs/storage.conf
echo "base_path=/data/fdfs" >> /etc/fdfs/storage.conf
sed -i '/store_path0/s/^/#/' /etc/fdfs/storage.conf
echo "store_path0=/data/fdfs" >> /etc/fdfs/storage.conf
sed -i "s/tracker_server=192.168.209.121:22122/tracker_server=$hostip:22122/g" /etc/fdfs/storage.conf
