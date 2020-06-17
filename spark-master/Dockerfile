FROM hadoop-spark
MAINTAINER Xuwu Cai <caixuwu@gmail.com>

ADD spark-master-entrypoint.sh /spark-master-entrypoint.sh
RUN chmod a+x /spark-master-entrypoint.sh

ADD Sparkproject-1.0-SNAPSHOT.jar /Sparkproject-1.0-SNAPSHOT.jar

ENTRYPOINT ["/spark-master-entrypoint.sh"]
