#!/bin/bash
#########################################################################
# Author: (zhangjunhui@domob.cn)
# Created Time: 2018-01-10 11:36:55
# File Name: docker-access.sh
# Description: 
#########################################################################

source ./env.sh

CTN_ID=$(docker ps -q -f "name=$CTN_NAME")
echo "Access into Container: $CTN_NAME#$CTN_ID"

docker exec -it $CTN_ID sh

# vim: set noexpandtab ts=4 sts=4 sw=4 :
