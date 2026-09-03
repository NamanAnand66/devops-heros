# Session 8: Docker Networking & Volumes

## Overview
This session explores advanced Docker networking drivers (Bridge, Host, Overlay, None), multi-container connectivity, Docker Volumes, and Bind Mounts for persistent data and hot-reloading development environments.

---

## Homework Tasks & Implementation

### Task 1: Docker Container Multi-Network Setup

#### Goal
Set up a 3-tier architecture (Frontend, Backend, Database) across isolated custom Docker bridge networks.

```
 [ Frontend (Nginx) ] <---> [ Network 1: frontend-net ] <---> [ Backend (Node/Alpine) ]
                                                                      ^
                                                                      |
 [ Database (MySQL) ] <---> [ Network 2: backend-net  ] <-------------+
```

#### Step-by-Step Execution Commands
```bash
# 1. Create 3 isolated Docker bridge networks
docker network create frontend-net
docker network create backend-net
docker network create db-net

# 2. Run Database container on db-net
docker run -d --name database-container --network db-net -e MYSQL_ROOT_PASSWORD=secret mysql:latest

# 3. Run Backend container on backend-net
docker run -d --name backend-container --network backend-net alpine sleep 3600

# 4. Attach Backend container to frontend-net as well (dual-homed container)
docker network connect frontend-net backend-container

# 5. Run Frontend container on frontend-net
docker run -d --name frontend-container --network frontend-net nginx:alpine

# 6. Verify connectivity
# Frontend can ping Backend:
docker exec -it frontend-container ping -c 2 backend-container

# Backend can ping Database:
docker exec -it backend-container ping -c 2 database-container

# Frontend CANNOT reach Database directly (Network Isolation enforced):
docker exec -it frontend-container ping -c 2 database-container  # Fails as expected
```

#### Task Screenshot & Evidence
![Screenshot: Multi-network container ping connectivity and network isolation test](./screenshots/task1_network_connectivity.png)

---

### Task 2: Host Network Mode

#### Overview
Host networking removes network isolation between the container and the Docker host, sharing the host's networking namespace directly.

```bash
# Pull Apache2 image
docker pull httpd:2.4-alpine

# Run container in host network mode (no -p port mapping needed)
docker run -d --name apache-host --network host httpd:2.4-alpine

# Access application directly on host port 80
curl http://localhost:80
```

#### Task Screenshot & Evidence
![Screenshot: Accessing Apache website directly on Port 80 via Host Network mode](./screenshots/task2_host_network_apache.png)

---

### Task 3: Bind Mount & Live Hot-Reloading

#### Overview
Bind mounts mount a file or directory from the host machine directly into a container path. Any modification on the host file system is reflected instantly inside the running container without requiring container rebuild or restart.

```bash
# 1. Create local project directory
mkdir -p ~/bind-mount-demo
cd ~/bind-mount-demo

# 2. Create index.html with initial content
echo "<h1>Hello students</h1>" > index.html

# 3. Run Nginx container with bind mount
docker run -d --name nginx-bind -p 8085:80 -v $(pwd)/index.html:/usr/share/nginx/html/index.html:ro nginx:alpine

# 4. Verify initial webpage content
curl http://localhost:8085

# 5. Modify index.html on host machine
echo "<h1>Hello students - Live Hot-Reloaded!</h1>" > index.html

# 6. Verify instant update without restarting container
curl http://localhost:8085
```

#### Task Screenshots & Evidence
![Screenshot: Initial Nginx website content ('Hello students') via Bind Mount](./screenshots/task3_bind_mount_initial.png)
![Screenshot: Live hot-reloaded webpage content after modifying index.html without restarting container](./screenshots/task3_bind_mount_updated.png)

---

### Task 4: Docker Overlay Networks

#### Concept & Architecture
- **Overlay Networks**: Distributed network driver used across multiple Docker daemon hosts (typically in Docker Swarm mode or multi-node clusters).
- **Functionality**: Creates a virtual VXLAN overlay network on top of underlying host-to-host physical network infrastructure, enabling containers on different physical nodes to communicate securely with encrypted IPsec tunnels without host port mapping.

#### Task Screenshot & Evidence
![Screenshot: Docker Overlay Network architecture diagram & Swarm network inspection](./screenshots/task4_overlay_network_diagram.png)

---

## Session Resources
- [Docker Network Drivers Official Documentation](https://docs.docker.com/engine/network/drivers/)
- [Docker Compose Multi-Container Configuration](./docker-compose.yml)
