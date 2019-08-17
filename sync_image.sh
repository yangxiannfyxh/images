#!/usr/bin/env bash
set -e

docker login --username=${username} --password=${password} ${registry}

all_image=`cat image.list`

for image in ${all_image} ; do
    name=`echo ${image} | awk -F "@" '{ print $1}'| awk -F "/" '{ print $NF }'`
    sync_image=${repo}:${prefix}${name}
    docker pull ${image}
    docker tag ${image} ${sync_image}
    docker push ${sync_image}
done
