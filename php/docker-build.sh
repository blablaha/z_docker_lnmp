#!/bin/bash
#########################################################################
# Author: (zhangjunhui@domob.cn)
# Created Time: 2018-01-10 09:23:45
# File Name: docker-build.sh
# Description: 
#########################################################################

source ./env.sh

docker build -t $IMG_NAME .

# vim: set noexpandtab ts=4 sts=4 sw=4 :
