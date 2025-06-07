# init-hive-metastore.sh - Initialize Hive Metastore
#!/bin/bash

max_retries=3
retries=0

# Wait for HDFS to be available
until hdfs dfs -ls / || [ $retries -eq $max_retries ]; do
  echo "Waiting for HDFS... attempt $((retries+1))/$max_retries"
  sleep 5
  retries=$((retries + 1))
done

if [ $retries -eq $max_retries ]; then
  echo "❌ HDFS not available after $max_retries attempts. Exiting."
  exit 1
fi

# Create Hive directories in HDFS
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod -R 777 /user/hive

hdfs dfs -mkdir -p /tmp
hdfs dfs -chmod -R 777 /tmp

# Initialize Hive Metastore schema
/opt/hive/bin/schematool -dbType postgres -initSchema

# Start Hive Metastore service
hive --service metastore

---

# spark-defaults.conf - Spark configuration
# Enable Hive support
spark.sql.catalogImplementation hive

# Hive metastore URI
spark.hadoop.hive.metastore.uris thrift://hive-metastore:9083

# HDFS default file system
spark.hadoop.fs.defaultFS hdfs://namenode:8020

