# Home Server Docker Stack

Public homelab repository for modular Docker services on a ThinkCentre (or similar) host. Each service lives in its own directory under `/srv/docker` and can be started independently.

**Security notice:** This repo is public and intended for homelab use on a trusted LAN. Default credentials are deliberately weak (`admin` / `admin`). Change them before exposing services beyond your LAN, and never commit real secrets, database files, or volume data.

## Default credentials

| Service | URL / access | Username | Password | Notes |
|---------|----------------|----------|----------|--------|
| Pi-hole | `https://<host>/admin/` | — | `admin` | Web UI on HTTPS port 443; DNS on port 53 |
| NAS (Samba) | `\\<host>\Data` | `admin` | `admin` | SMB on port 445 (host network) |
| File Browser | `http://<host>:8080` | `admin` | `admin` | Credentials stored in `nas/filebrowser.db` (gitignored) |
| PostgreSQL | `<host>:5432` | `admin` | `admin` | `POSTGRES_*` env vars in compose |
| Portainer | `http://<host>:9000` | (set on first visit) | (set on first visit) | Not preset in compose |
| MQTT (Mosquitto) | `1883` / `9001` | — | — | No authentication in default compose |
| Node-RED | `http://<host>:1880` | — | — | Enable auth in Node-RED if needed |
| Glances | `http://<host>:61208` | — | — | Read-only monitoring |
| Minecraft | `25565` | — | — | Server properties in `./data` after first run |

Replace `<host>` with your server LAN IP (e.g. `192.168.0.198`).

## Services

| Service | Directory | Ports | Purpose |
|---------|-----------|-------|---------|
| PostgreSQL | `postgres/` | 5432 | Relational database |
| MQTT (Mosquitto) | `mqtt/` | 1883, 9001 | IoT message broker |
| Node-RED | `node-red/` | 1880 | Automation flows |
| Portainer | `portainer/` | 9000, 9443 | Docker UI |
| Glances | `glances/` | 61208 (host) | System monitoring |
| Minecraft (Paper) | `minecraft/` | 25565 | Game server |
| Pi-hole | `pihole/` | 53 (DNS), 443 (admin HTTPS) | DNS ad blocking |
| NAS + File Browser | `nas/` | 445 (Samba), 8080 (web UI) | File shares and web UI |

### Pi-hole on Android (and other devices)

1. Connect to your home Wi-Fi.
2. Set **Wi-Fi DNS** to your server IP (e.g. `192.168.0.198`).
3. Turn **Private DNS** off (Settings → Network → Private DNS).
4. Open `https://<host>/admin/` and accept the self-signed certificate warning.

For whole-network coverage, set the router DHCP DNS server to your Pi-hole IP.

## Quick start

Clone on the server:

```bash
sudo mkdir -p /srv/docker
sudo chown $USER:$USER /srv/docker
git clone https://github.com/VincevanLommen/Home-server.git /srv/docker
cd /srv/docker
git checkout dev
```

Start one stack:

```bash
docker compose -f postgres/docker-compose.yml up -d
```

Start or stop everything:

```bash
./start-all.sh
./stop-all.sh
```

## Directory layout

```
/srv/docker
├── postgres/
├── mqtt/
├── node-red/
├── portainer/
├── glances/
├── minecraft/
├── pihole/
├── nas/
├── config.yml
├── start-all.sh
└── stop-all.sh
```

Persistent data under each service `data/`, Pi-hole `etc-pihole/`, `pihole/etc-dnsmasq.d/`, and `nas/filebrowser.db` are excluded via `.gitignore`.

## Goals

- Modular, one-compose-per-service layout
- English documentation only
- Homelab defaults (`admin` / `admin`) where applicable
- No secrets or runtime databases in Git
