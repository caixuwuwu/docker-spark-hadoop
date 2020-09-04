#FROM gcr.io/graphic-outlook-287512/github.com/caixuwuwu/docker-spark-hadoop:v0.0.1
FROM hadoop-spark
MAINTAINER Xuwu Cai <caixuwu@gmail.com>

ADD spark-master-entrypoint.sh /spark-master-entrypoint.sh
RUN chmod a+x /spark-master-entrypoint.sh

ENTRYPOINT ["/spark-master-entrypoint.sh"]
