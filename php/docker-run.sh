#!/bin/bash
#########################################################################
# Author: (zhangjunhui@domob.cn)
# Created Time: 2018-01-09 19:59:09
# File Name: docker-run.sh
# Description: 
#########################################################################
PWD=$(pwd)

source ./env.sh

docker run --rm --name $CTN_NAME -p 9000:9000 -d $IMG_NAME

# vim: set noexpandtab ts=4 sts=4 sw=4 :
