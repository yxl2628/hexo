#!/bin/sh
# add the host ip into the container hosts
/sbin/ip route|awk '/default/ { print  $3,"\tdockerhost" }' >> /etc/hosts
# update the code lasetst
echo "==================update hexo======================"
cd /opt/blog
git fetch --all
git reset --hard origin/master
echo "==================update githooks server======================"
cd /opt/auto-public-hexo
git fetch --all
git reset --hard origin/master
# generate html
echo "==================update blog======================"
cd /opt/blog/source
git fetch --all
git reset --hard origin/master
hexo g
# start nginx
echo "==================start nginx======================"
/usr/sbin/nginx -c /opt/nginx/nginx.conf
# start auto-publish-server
echo "==================start githooks server======================"
cd /opt/auto-public-hexo
node src/server.js