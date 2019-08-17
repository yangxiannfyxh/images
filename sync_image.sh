#!/bin/bash
full_image=${registry}/${image}${tag}
sync_image=${repo}:${image_short}
docker pull ${full_image}
docker login --username=${username} --password=${password} ${reg}
docker tag ${full_image} ${sync_image}
docker push ${sync_image}
