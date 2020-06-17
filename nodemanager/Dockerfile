FROM hadoop-base
MAINTAINER caixuwu@outlook.com

ADD run.sh /run.sh
RUN chmod a+x /run.sh
RUN curl -fSL "http://dl.bintray.com/sequenceiq/sequenceiq-bin/hadoop-native-64-2.7.0.tar" -o hadoop-native.tar.gz \
    && tar -xvf hadoop-native.tar.gz -C /opt/hadoop-2.7.7/lib/ \
    && tar -xvf hadoop-native.tar.gz -C /opt/hadoop-2.7.7/lib/native \
    && rm hadoop-native.tar.gz

CMD ["/run.sh"]
