#!/bin/bash
#########################################################################
# Author: (zhangjunhui@domob.cn)
# Created Time: 2018-01-09 19:59:09
# File Name: docker-run.sh
# Description: 
#########################################################################

docker run --name docker_nginx \
	-p 9080:80 \
	-p 9443:443 \
	-v ./conf/nginx.conf:/etc/nginx/nginx.conf:ro \
	-v ./conf/sites-enabled:/etc/nginx/sites-enabled:ro \
	-v ./logs:/var/log/nginx \
	z_nginx

# vim: set noexpandtab ts=4 sts=4 sw=4 :
