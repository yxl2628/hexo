echo "===================ps all node=================="
ps -ef|grep node
echo "==================kill all node================="
ps -ef | grep node | awk '{print $2}' | xargs kill -9
echo "==================show the kill result================="
ps -ef|grep node
echo "================restart the node================"
cd /opt/auto-public-hexo
node src/server.js