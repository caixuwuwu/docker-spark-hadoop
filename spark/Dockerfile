FROM bde2020/hadoop
MAINTAINER Xuwu Cai <caixuwu@gmail.com>

ENV SPARK_VERSION 2.4.5
ENV SPARK_URL https://www.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz
RUN set -x \
    && wget "$SPARK_URL" -O /tmp/spark.tar.gz \
    && tar -xvf /tmp/spark.tar.gz -C /opt/ \
    && rm /tmp/spark.tar.gz*

#RUN apt-get install -y --no-install-recommends python3 python-pip \
#    && pip install --upgrade pip \
#    && pip3 install numpy===1.15.1 \
#    && pip3 install pandas==0.24.1 \
#    && pip3 install pyspark==2.4.5

ENV SPARK_HOME=/opt/spark-$SPARK_VERSION
RUN mv /opt/spark-$SPARK_VERSION-* $SPARK_HOME

WORKDIR $SPARK_HOME
ENV PATH $SPARK_HOME/bin:$PATH

ADD spark-entrypoint.sh /
RUN chmod a+x /spark-entrypoint.sh

ADD runhistoryserver.sh /
RUN chmod a+x /runhistoryserver.sh

RUN echo "export SPARK_DIST_CLASSPATH=$(hadoop classpath)" >> /opt/spark-$SPARK_VERSION/conf/spark-env.sh

ENTRYPOINT ["/spark-entrypoint.sh"]
CMD ["/runhistoryserver.sh"]
