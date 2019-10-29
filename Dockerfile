FROM rpmbuild/centos7

LABEL maintainer="Kerem ATAM <kerematam@gmail.com>"

USER root
RUN yum -y update && \
    yum install -y \
    wget \
    bzip2-devel \
    zlib* \
    && yum clean all 

USER builder
COPY --chown=builder:builder ./ /home/builder/rocketmq-client-cpp
ENTRYPOINT /home/builder/rocketmq-client-cpp/build.sh
