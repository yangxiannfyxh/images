all="proxy proxy-init controller grafana web"
for image in ${all} ; do
    fullimage=registry.cn-beijing.aliyuncs.com/nfyxhan/linkerd-io_proxy-init:${image}
    docker pull ${fullimage}
    docker tag ${fullimage} gcr.io/linkerd-io/${image}:stable-2.0.0
done
