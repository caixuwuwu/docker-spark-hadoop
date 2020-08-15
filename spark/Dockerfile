FROM hadoop-base
MAINTAINER Xuwu Cai <caixuwu@gmail.com>

ENV SPARK_VERSION 2.4.5
ENV SPARK_URL https://www.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz
RUN set -x \
    && wget "$SPARK_URL" -O /tmp/spark.tar.gz \
    && tar -xvf /tmp/spark.tar.gz -C /opt/ \
    && rm /tmp/spark.tar.gz*

RUN apt-get install -y --autoremove --no-install-recommends python3.7 python-pip \
    && apt-get clean
    && pip3 install --no-cache-dir  --disable-pip-version-check numpy===1.15.1 requests==2.22.0 happybase==1.2.0 \
    thrift==0.11.0 pandas==0.24.1 pyspark==2.4.5 pymysql==0.8.0 arrow==0.12.1 tensorflow==2.2.0 tensorflowonspark \
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
