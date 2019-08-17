#!/bin/bash
docker pull ${registry}/${image}${tag}
docker login --username=${username} --password=${password} ${reg}
docker tag ${registy}/${image}${tag} ${repo}:${image_short}
docker push ${repo}:${image_short}
