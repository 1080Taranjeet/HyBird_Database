# 🐘 HyBird\_Database: Dockerized Hadoop-Spark-Hive Cluster

A fully containerized **single-node** setup for running a Big Data ecosystem using **Apache Hadoop**, **Apache Spark**, and **Apache Hive**, complete with **HUE** as a web-based data platform for interactive querying and management.

---

## 🚀 Features

* ✅ Hadoop Distributed File System (HDFS)
* ⚙️ YARN for cluster resource management
* 💡 Apache Hive for SQL-like querying on big data
* 🔥 Apache Spark for fast, distributed processing
* 🌐 HUE web UI (available on `http://localhost:8888`)
* 🐳 Fully containerized using Docker & Docker Compose
* 🌐 **Single-node deployment for development or testing**

---

## 📁 File Structure

```
.
├── docker-compose.yml          # Main orchestration file
├── hive-site.xml               # Hive configuration
├── hdfs-site.xml               # HDFS config
├── core-site.xml               # Core Hadoop settings
├── yarn-site.xml               # YARN config
├── spark-defaults.conf         # Spark config
├── capacity-scheduler.xml      # YARN scheduling
├── hue.ini                     # HUE configuration
├── init-hive-metastore.sh      # Script to initialize Hive metastore
├── hive_server_debug_logs.txt  # Debug logs (optional)
└── spark-cassandra-connector/  # (Optional integration if needed)
```

---

## 📦 Prerequisites

* Docker (v20+ recommended)
* Docker Compose (v2+)

---

## 🛠️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/1080Taranjeet/HyBird_Database.git
cd HyBird_Database
```

### 2. Start the Cluster

```bash
docker-compose up -d
```

This brings up HDFS (NameNode + DataNodes), Hive, Spark, and HUE.

### 3. Access HUE Dashboard

Visit:

```
http://localhost:8888
```

Use default credentials or set up a new account via the UI.

---

## 🧲 Validation & Usage

* Upload files to HDFS using HUE
* Run Hive queries in HUE’s Hive Editor
* Submit and monitor Spark jobs
* Monitor YARN jobs via the HUE interface

---

## 🐳 Stopping the Cluster

```bash
docker-compose down -v
```

This stops all containers and removes volumes.

---

## ❓ Troubleshooting

* **Port conflicts?** Update ports in `docker-compose.yml`
* **Slow startup?** Monitor container logs to ensure proper initialization:

  ```bash
  docker-compose logs -f
  ```
* **HUE UI unavailable?** Check HUE logs:

  ```bash
  docker-compose logs hue
  ```

---

## 🧠 Roadmap

* [ ] Presto/Trino integration
* [ ] Kafka support for streaming
* [ ] Health checks & restart policies
* [ ] Multi-node scaling instructions

---

## 📜 License

Licensed under [MIT](LICENSE).

---

## ✨ Author

Taranjeet Singh — [GitHub](https://github.com/1080Taranjeet)
