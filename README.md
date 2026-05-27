# Home Server – Docker Stack

Deze repository bevat mijn homeserver‑omgeving, opgebouwd met Docker.  
Alle services staan in aparte mappen onder `/srv/docker` en kunnen individueel of gezamenlijk worden gestart.

## Inhoud van de stack

### PostgreSQL
Locatie: `/srv/docker/postgres`  
Poort: `5432`  
Functie: relationele database voor applicaties en data‑opslag.

Starten:
```
docker compose -f postgres/docker-compose.yml up -d
```

---

### MQTT Broker (Mosquitto)
Locatie: `/srv/docker/mqtt`  
Poorten: `1883` (MQTT), `9001` (WebSocket)  
Functie: message broker voor IoT‑communicatie en automatisaties.

Starten:
```
docker compose -f mqtt/docker-compose.yml up -d
```

---

### Node-RED
Locatie: `/srv/docker/node-red`  
Poort: `1880`  
Functie: low‑code automation platform voor flows en integraties.

Starten:
```
docker compose -f node-red/docker-compose.yml up -d
```

---

### Portainer (Docker Manager)
Locatie: `/srv/docker/portainer`  
Poorten: `9000` (HTTP), `9443` (HTTPS)  
Functie: webinterface om Docker containers te beheren.

Starten:
```
docker compose -f portainer/docker-compose.yml up -d
```

---

### Glances Dashboard
Locatie: `/srv/docker/glances`  
Poort: `61208`  
Functie: systeemmonitor voor CPU, RAM, disk, netwerk en containers.

Starten:
```
docker compose -f glances/docker-compose.yml up -d
```

Dashboard:
```
http://localhost:61208
```

---

### Minecraft Paper Server
Locatie: `/srv/docker/minecraft`  
Poort: `25565`  
Functie: high‑performance Minecraft server op basis van PaperMC.

Starten:
```
docker compose -f minecraft/docker-compose.yml up -d
```

---

## Alles in één keer starten

In de root van `/srv/docker` staan scripts om de volledige stack te starten of te stoppen.

Start alles:
```
./start-all.sh
```

Stop alles:
```
./stop-all.sh
```

---

## Directory structuur

```
/srv/docker
├── postgres/
├── mqtt/
├── node-red/
├── portainer/
├── glances/
└── minecraft/
```

Elke map bevat een eigen `docker-compose.yml` en eventuele `data/` of `config/` mappen.

---

## Doel van dit project

- Een modulaire en overzichtelijke homeserver opzetten  
- Alle services via Git versiebeheerbaar maken  
- Zowel lokaal (WSL) als op een fysieke server kunnen draaien  
- Eenvoudig beheer via Portainer en start/stop scripts  
