FROM gcr.io/graphic-outlook-287512/github.com/caixuwuwu/docker-spark-hadoop:v0.0.1
#FROM hadoop-base
MAINTAINER Xuwu <caixuwu@gmail.com>

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
