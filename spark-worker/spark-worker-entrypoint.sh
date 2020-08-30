#!/bin/bash
set -e

for c in `printenv | perl -sne 'print "$1 " if m/^SPARK_CONF_(.+?)=.*/'`; do 
    name=`echo ${c} | perl -pe 's/___/-/g; s/__/_/g; s/_/./g'`
    var="SPARK_CONF_${c}"
    value=${!var}
    echo "Setting SPARK property $name=$value"
    echo $name $value >> $SPARK_HOME/conf/spark-defaults.conf
done 

if [ -z "$SPARK_MASTER_URL" ]; then
  echo "Spark master URL not specified"
  exit 2
fi
/entrypoint.sh
$SPARK_HOME/sbin/start-slave.sh "$SPARK_MASTER_URL"
exec tail -f $SPARK_HOME/logs/*
