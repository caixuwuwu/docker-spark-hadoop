#FROM gcr.io/graphic-outlook-287512/github.com/caixuwuwu/docker-spark-hadoop:v0.0.1
FROM hadoop-base
MAINTAINER Xuwu Cai <caixuwu@gmail.com>

ENV SPARK_VERSION 2.4.6
ENV SPARK_URL https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz
RUN set -x \
    && wget -c "$SPARK_URL" -O /tmp/spark.tar.gz \
    && tar -xvf /tmp/spark.tar.gz -C /opt/ \
    && rm /tmp/spark.tar.gz*

RUN cat /etc/apt/sources.list.bak >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --autoremove --no-install-recommends python3-pip python3-dev \
        build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev htop \
    && apt-get clean \
    && cp /usr/bin/python3 /usr/bin/python \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir --disable-pip-version-check setuptools \
    && pip3 install --no-cache-dir --disable-pip-version-check requests==2.22.0 happybase==1.2.0 pandas==0.24.1 \
        pymysql==0.8.0 tensorflowonspark tensorflow \
    && rm -rf ~/.cache/pip

ENV SPARK_HOME=/opt/spark-$SPARK_VERSION
RUN mv /opt/spark-$SPARK_VERSION-* $SPARK_HOME

WORKDIR $SPARK_HOME
ENV PATH $SPARK_HOME/bin:$PATH

ADD spark-entrypoint.sh /
ADD runhistoryserver.sh /
RUN chmod a+x /spark-entrypoint.sh \
    && chmod a+x /runhistoryserver.sh \
    && echo "export SPARK_DIST_CLASSPATH=$(hadoop classpath)" >> /opt/spark-$SPARK_VERSION/conf/spark-env.sh

ENTRYPOINT ["/spark-entrypoint.sh"]
CMD ["/runhistoryserver.sh"]
