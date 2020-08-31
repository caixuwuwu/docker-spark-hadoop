#!/bin/bash

namedir=`echo $HDFS_CONF_dfs_namenode_data_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "Namenode data directory not found: $namedir"
  exit 2
fi

rm -rf /hadoop/dfs/name
$HADOOP_PREFIX/bin/hdfs namenode -format -force -nonInteractive
$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode