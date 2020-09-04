#!/bin/bash

datadir=`echo $HDFS_CONF_dfs_datanode_data_dir | perl -pe 's#file://##'`
if [ ! -d $datadir ]; then
  echo "Datanode data directory not found: $dataedir"
  exit 2
fi

echo datanode-1 > /opt/hadoop-2.7.7/etc/hadoop/slaves
echo datanode-2 >> /opt/hadoop-2.7.7/etc/hadoop/slaves
rm -rf /hadoop/dfs/data
$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR datanode
