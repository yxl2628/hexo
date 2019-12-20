echo "===================ps all node=================="
ps -ef|grep node
echo "==================kill all node================="
ps -ef | grep node | awk '{print $2}' | xargs kill -9
echo "==================show the kill result================="
ps -ef|grep node
echo "==================generate html================="
cd /opt/blog/source
git fetch --all
git reset --hard origin/master
cd /opt/blog
hexo g
echo "================restart the node================"
cd /opt/auto-public-hexo
node src/server.js