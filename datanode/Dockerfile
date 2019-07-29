FROM bde2020/hadoop
MAINTAINER Xuwu <caixuwu@gmail.com>

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

RUN curl -fSL "http://dl.bintray.com/sequenceiq/sequenceiq-bin/hadoop-native-64-2.7.0.tar" -o hadoop-native.tar.gz \
    && tar -xvf hadoop-native.tar.gz -C /opt/hadoop-2.7.7/lib/ \
    && tar -xvf hadoop-native.tar.gz -C /opt/hadoop-2.7.7/lib/native \
    && rm hadoop-native.tar.gz

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
