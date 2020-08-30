FROM gcr.io/graphic-outlook-287512/github.com/caixuwuwu/docker-spark-hadoop:v0.0.1
#FROM hadoop-base
MAINTAINER caixuwu@outlook.com

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
