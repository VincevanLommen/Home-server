# Home Server – Docker Stack

This repository contains my modular home server environment built with Docker.
Each service lives in its own directory under `/srv/docker` and can be started individually or all at once.

---

## 📦 Services Overview

### PostgreSQL
**Location:** `/srv/docker/postgres`  
**Port:** `5432`  
**Purpose:** Relational database for applications and data storage.

Start:
```
docker compose -f postgres/docker-compose.yml up -d
```

---

### MQTT Broker (Mosquitto)
**Location:** `/srv/docker/mqtt`  
**Ports:** `1883` (MQTT), `9001` (WebSocket)  
**Purpose:** Message broker for IoT communication and automation.

Start:
```
docker compose -f mqtt/docker-compose.yml up -d
```

---

### Node-RED
**Location:** `/srv/docker/node-red`  
**Port:** `1880`  
**Purpose:** Low-code automation platform for flows and integrations.

Start:
```
docker compose -f node-red/docker-compose.yml up -d
```

---

### Portainer (Docker Manager)
**Location:** `/srv/docker/portainer`  
**Ports:** `9000` (HTTP), `9443` (HTTPS)  
**Purpose:** Web interface for managing Docker containers.

Start:
```
docker compose -f portainer/docker-compose.yml up -d
```

---

### Glances (System Monitor)
**Location:** `/srv/docker/glances`  
**Port:** `61208`  
**Purpose:** System monitoring for CPU, RAM, disk, network and processes.

Start:
```
docker compose -f glances/docker-compose.yml up -d
```

Dashboard:
```
http://localhost:61208
```

---

### Dashdot (System Dashboard)
**Location:** `/srv/docker/dashdot`  
**Port:** `3001`  
**Purpose:** Clean and modern system dashboard with CPU, RAM, disk, network and temperature widgets.

Start:
```
docker compose -f dashdot/docker-compose.yml up -d
```

Dashboard:
```
http://localhost:3001
```

---

### Minecraft Paper Server
**Location:** `/srv/docker/minecraft`  
**Port:** `25565`  
**Purpose:** High‑performance Minecraft server based on PaperMC.

Start:
```
docker compose -f minecraft/docker-compose.yml up -d
```

---

## 🚀 Start Everything at Once

In the root of `/srv/docker` there are helper scripts to start or stop the entire stack.

Start all:
```
./start-all.sh
```

Stop all:
```
./stop-all.sh
```

---

## 📁 Directory Structure

```
/srv/docker
├── postgres/
├── mqtt/
├── node-red/
├── portainer/
├── glances/
├── dashdot/
└── minecraft/
```

Each directory contains its own `docker-compose.yml` and any required `data/` or `config/` folders.

---

## 🎯 Goals of This Project

- Maintain a modular and clean home server setup  
- Keep all services version-controlled with Git  
- Run both locally (WSL) and on physical hardware  
- Provide easy management via Portainer and helper scripts  
