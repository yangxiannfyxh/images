#!/usr/bin/env bash
set -e
registry=${registry:-"registry.cn-hangzhou.aliyuncs.com"}
repo=${registry}/${repo:-"nfyxhan_gcr"}
docker login --username=${username} --password=${password} ${registry}

all_image=`cat image.list`

for line in ${all_image} ; do
    start=`echo ${line} | awk -F "@" '{ print $1 }'`
    if [[ "${start}" == "" ]] ; then
    	remote_repo=`echo "${line}" | awk -F "@" '{ print $2 }'`
    	prefix=`echo "${line}" | awk -F "@" '{ print $3 }'`
        continue
	#break
    fi
    name=`echo ${line} | awk -F "@" '{ print $1}'| awk -F "/" '{ print $NF }'`
    remote_image=${remote_repo}/${name}
    sync_image=${repo}/${prefix}${name}
    echo ${remote_image}
    echo ${sync_image}
    docker pull ${remote_image}
    docker tag ${remote_image} ${sync_image}
    docker push ${sync_image}
done
