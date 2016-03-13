#!/bin/bash

set -xe

export TEST_CONTAINER=$(echo nginx_test_$(date +%s))
test ! -z ${BUILD_IMG_NAME}

echo "## start stack"
docker-compose up -d

sleep 5

echo "#### Check HTTP connection"
echo ">> curl -s http://window.node.consul |egrep 'nginx/.*passing'"
docker exec -t ${TEST_CONTAINER} curl -s --insecure https://window.node.consul:443 |egrep "nginx/.*passing"
echo ">> curl -s http://window.node.consul |egrep 'nginx2/.*passing'"
docker exec -t ${TEST_CONTAINER} curl -s --insecure https://window.node.consul:443 |egrep "nginx2/.*passing"
echo "#### Check HTTPS connection"
echo ">> curl -s --insecure https://window.node.consul:443 |egrep 'nginx/.*passing'"
docker exec -t ${TEST_CONTAINER} curl -s --insecure https://window.node.consul:443 |egrep "nginx/.*passing"
echo ">> curl -s --insecure https://window.node.consul:443 |egrep 'nginx2/.*passing'"
docker exec -t ${TEST_CONTAINER} curl -s --insecure https://window.node.consul:443 |egrep "nginx2/.*passing"

echo "## remove stack"
docker-compose kill 
docker-compose rm -f
