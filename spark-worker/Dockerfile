FROM gcr.io/graphic-outlook-287512/github.com/caixuwuwu/docker-spark-hadoop:v0.0.1
#FROM hadoop-spark
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

ADD spark-worker-entrypoint.sh /spark-worker-entrypoint.sh
RUN chmod a+x /spark-worker-entrypoint.sh

ENTRYPOINT ["/spark-worker-entrypoint.sh"]
