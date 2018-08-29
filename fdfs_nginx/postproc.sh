#!/bin/bash
/usr/bin/fdfs_trackerd /etc/fdfs/tracker.conf
/usr/bin/fdfs_storaged /etc/fdfs/storage.conf
/usr/local/nginx/sbin/nginx
