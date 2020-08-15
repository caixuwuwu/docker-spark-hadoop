#!/bin/bash

namedir=`echo $HDFS_CONF_dfs_secondary_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "SecondaryNamenode name directory not found: $namedir"
  exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

if [ "`ls -A $namedir`" == "" ]; then
  echo "Formatting secondarynamenode name directory: $namedir"
  $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR secondarynamenode -format $CLUSTER_NAME
fi

rm -rf /hadoop/dfs/*
$HADOOP_PREFIX/bin/hdfs namenode -format -force -nonInteractive
$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode
$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR secondarynamenode
