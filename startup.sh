#!/bin/sh
# add the host ip into the container hosts
/sbin/ip route|awk '/default/ { print  $3,"\tdockerhost" }' >> /etc/hosts
# update the code lasetst
cd /opt/blog
git fetch --all
git reset --hard origin/master
cd /opt/auto-public-hexo
git fetch --all
git reset --hard origin/master
# start nginx
/usr/sbin/nginx -c /opt/nginx/nginx.conf
# start auto-publish-server
cd /opt/auto-public-hexo
node src/server.js