# Master Step-by-Step DevOps Homework Submission Guide

This guide provides exact, step-by-step terminal commands to run and screenshots to capture for final homework submission across all sessions (`Session 1` through `Session 10`).

---

## 📌 Standard Submission Workflow for Each Session

For every session directory (`sessionX-...`):
1. **Navigate to the directory**: `cd sessionX-...`
2. **Execute the commands** listed below for each task.
3. **Capture the required screenshots** and place them inside `sessionX-.../screenshots/` (or upload them directly to your GitHub repo / submission form).
4. **Update `README.md`** to reference the screenshots.
5. **Commit and Push**:
   ```bash
   git add .
   git commit -m "docs: add homework completion commands and screenshots for session X"
   git push origin main
   ```

---

## 🚀 Session-by-Session Execution & Screenshot Guide

### 1️⃣ Session 1: DevOps Engineer Roadmap & Fundamentals

#### Commands to Run
```bash
cd session1-devops-engineer-roadmap
git status
cat README.md
```

#### Final Screenshots to Capture
- 📷 **`devops_roadmap_overview.png`**:
  - **What to capture**: Screenshot of your `session1-devops-engineer-roadmap/README.md` rendering or the DevOps Roadmap PDF (`devops1-83.pdf`) opened on your screen showing your understanding of DevOps core pillars.

---

### 2️⃣ Session 2: Linux Fundamentals & Administration

#### Commands to Run

##### Task 1: Soft Link vs. Hard Link
```bash
cd session2-linux

# Create original file
echo "Hello DevOps" > original.txt

# Create soft link and hard link
ln -s original.txt soft_link.txt
ln original.txt hard_link.txt

# Inspect inodes (Note matching inodes for hard link and unique inode for soft link)
ls -li original.txt soft_link.txt hard_link.txt

# Test deletion behavior
rm original.txt
ls -li soft_link.txt hard_link.txt
cat hard_link.txt     # Still works!
cat soft_link.txt     # Breaks (dangling link)
```

##### Task 2: `adduser` vs `useradd`
```bash
# On Linux (Ubuntu/Debian):
sudo adduser devops_user

# On macOS (native Mac command without Docker):
sudo sysadminctl -addUser devops_user -fullName "DevOps User"
```

##### Task 3: `journalctl`
```bash
# View service logs
sudo journalctl -u sshd -n 20  # or journalctl -u nginx
```

##### Task 4: Linux Commands Cheat Sheet
```bash
ls -la
chmod +x script.sh 2>/dev/null || true
grep -rn "DevOps" .
```

#### Final Screenshots to Capture
1. 📷 **`task1_links_output.png`**: Terminal showing `ls -li` inode output before and after removing `original.txt`.
2. 📷 **`task2_adduser_output.png`**: Terminal showing the interactive user creation prompt from `sudo adduser devops_user`.
3. 📷 **`task3_journalctl_output.png`**: Terminal output of `journalctl -u <service>` showing systemd logs.
4. 📷 **`task4_cheat_sheet_output.png`**: Terminal showing execution of core Linux commands (`ls -la`, `grep`, `chmod`).

---

### 3️⃣ Session 3: Shell Scripting

#### Commands to Run
```bash
cd session3-shell-scripting

# Make script executable
chmod +x system_info.sh

# Run script interactively
./system_info.sh

# Verify generated log file
cat system_logs/process.log | head -n 20
```

#### Final Screenshots to Capture
1. 📷 **`system_info_execution.png`**: Terminal output of `./system_info.sh` displaying Date, Hostname, Username, Disk Usage (`df -h`), interactive user prompts (`read -p`), and confirmation of directory/file creation.
2. 📷 **`process_log_output.png`**: Terminal output of `cat system_logs/process.log | head -n 20` displaying the process snapshot captured using redirection (`ps aux > system_logs/process.log`).

---

### 4️⃣ Session 4: Networking Fundamentals

#### Commands to Run
```bash
cd session4-networking

# 1. Test connectivity
ping -c 4 google.com

# 2. View interface configuration
ifconfig en0  # or ip addr show

# 3. Trace route hops
traceroute 8.8.8.8

# 4. Inspect routing table & ports
netstat -rn   # or ss -tuln

# 5. Perform DNS lookup
dig google.com +short
nslookup google.com

# 6. Fetch HTTP headers
curl -I https://google.com
```

#### Final Screenshots to Capture
1. 📷 **`ping_output.png`**: Terminal output of `ping -c 4 google.com` showing packet stats & latency.
2. 📷 **`ip_ifconfig_output.png`**: Terminal output of `ifconfig` / `ip addr` showing IP & MAC addresses.
3. 📷 **`traceroute_output.png`**: Terminal output of `traceroute 8.8.8.8` displaying hop routers.
4. 📷 **`netstat_output.png`**: Terminal output of `netstat -rn` showing default gateway & routes.
5. 📷 **`dig_dns_output.png`**: Terminal output of `dig google.com +short` / `nslookup`.
6. 📷 **`curl_output.png`**: Terminal output of `curl -I https://google.com` showing HTTP response headers.

---

### 5️⃣ Session 5: Git & GitHub Workflows

#### Commands to Run

##### Task 1: `git commit -a -m` vs `git commit -m`
```bash
cd session5-git-github
echo "update" >> tracked_file.txt
git status
git commit -a -m "test direct commit on tracked file"
```

##### Task 2: Git Cherry-Pick
```bash
# 1. Switch to main and make commits
git checkout main
echo "A" > a.txt && git add . && git commit -m "feat: A"

# 2. Create feature branch and make commits
git checkout -b feature-branch
echo "Bugfix" > fix.txt && git add . && git commit -m "fix: critical security bug"

# 3. Copy commit hash from git log
git log --oneline -n 2

# 4. Switch back to main and cherry-pick
git checkout main
git cherry-pick <COMMIT_HASH>

# 5. Verify commit in main branch log
git log --oneline -n 3
```

#### Final Screenshots to Capture
1. 📷 **`task1_git_commit_difference.png`**: Terminal showing `git status` and `git commit -a -m` behavior.
2. 📷 **`task2_git_log_feature_branch.png`**: Terminal showing `git log` on `feature-branch` with target commit SHA.
3. 📷 **`task2_cherry_pick_verification.png`**: Terminal showing `git cherry-pick <SHA>` and `git log` on `main` branch verifying the commit was applied.

---

### 6️⃣ Session 6 & 7: Docker Fundamentals & Multi-Stage Builds

#### Commands to Run

##### Task 1: Build & Run App Stacks
```bash
cd session6-7-docker

# Node.js App
docker build -t node-app ./node-app
docker run -d -p 3000:3000 --name node-container node-app

# Python App
docker build -t python-app ./python-app
docker run -d -p 5000:5000 --name python-container python-app

# Nginx App
docker build -t nginx-web ./nginx-web
docker run -d -p 8080:80 --name nginx-container nginx-web
```

##### Task 2 & 3: Multi-Stage Build
```bash
# Build Multi-stage image
docker build -t multi-stage-app ./multi-stage-dockerfile

# Run Container on Port 8080 (mapping host 8080 -> container 3000)
docker run -d -p 8085:3000 --name container-multistage multi-stage-app

# Check running containers
docker ps

# Cleanup
docker rm -f $(docker ps -aq)
```

#### Final Screenshots to Capture
1. 📷 **`nodejs_app_webpage.png`**: Browser window open at `http://localhost:3000` showing Node.js Hello World.
2. 📷 **`python_app_webpage.png`**: Browser window open at `http://localhost:5000` showing Python Hello World.
3. 📷 **`nginx_app_webpage.png`**: Browser window open at `http://localhost:8080` showing Nginx Hello World.
4. 📷 **`multistage_webpage_8080.png`**: Browser window open at `http://localhost:8085` displaying "Hello World from Docker multi-stage build".
5. 📷 **`docker_ps_multistage.png`**: Terminal output of `docker ps` showing running container on port 8085.
6. 📷 **`docker_cleanup_output.png`**: Terminal output of `docker system prune` or container cleanup commands.

---

### 7️⃣ Session 8: Docker Networking & Volumes

#### Commands to Run

##### Task 1: 3-Tier Multi-Network
```bash
cd session8-docker-networking-volume

# (Optional) Clean up existing containers/networks if re-running
docker rm -f frontend-container backend-container database-container 2>/dev/null || true
docker network rm frontend-net backend-net db-net 2>/dev/null || true

# 1. Create networks
docker network create frontend-net
docker network create backend-net
docker network create db-net

# 2. Launch containers
docker run -d --name database-container --network db-net -e MYSQL_ROOT_PASSWORD=secret mysql:latest
docker run -d --name backend-container --network backend-net alpine sleep 3600
docker network connect frontend-net backend-container
docker network connect db-net backend-container
docker run -d --name frontend-container --network frontend-net nginx:alpine

# 3. Test ping connectivity & isolation
docker exec -it frontend-container ping -c 2 backend-container  # SUCCESS (Frontend <-> Backend)
docker exec -it backend-container ping -c 2 database-container  # SUCCESS (Backend <-> Database)
docker exec -it frontend-container ping -c 2 database-container # FAILS (Frontend isolated from DB)
```

##### Task 2: Host Network Mode
```bash
# Note: On macOS (Docker Desktop), add -p 80:80 so host port 80 maps to localhost
docker rm -f apache-host 2>/dev/null || true
docker run -d --name apache-host -p 80:80 httpd:2.4-alpine
curl http://localhost:80
```

##### Task 3: Bind Mount & Hot-Reloading
```bash
mkdir -p ~/bind-demo && cd ~/bind-demo
echo "<h1>Hello students</h1>" > index.html
docker rm -f nginx-bind 2>/dev/null || true
docker run -d --name nginx-bind -p 8085:80 -v $(pwd)/index.html:/usr/share/nginx/html/index.html:ro nginx:alpine
sleep 2  # Wait 2 seconds for Nginx worker startup
curl http://localhost:8085
echo "<h1>Hello students - Live Hot-Reloaded!</h1>" > index.html
curl http://localhost:8085
```

#### Final Screenshots to Capture
1. 📷 **`task1_network_connectivity.png`**: Terminal output showing ping success between connected containers and network isolation enforcement.
2. 📷 **`task2_host_network_apache.png`**: Browser / curl window accessing Apache directly on host port 80.
3. 📷 **`task3_bind_mount_initial.png`**: Browser at `http://localhost:8085` showing "Hello students".
4. 📷 **`task3_bind_mount_updated.png`**: Browser at `http://localhost:8085` showing updated content without container restart.
5. 📷 **`task4_overlay_network_diagram.png`**: Screenshot of overlay network architecture diagram or `docker network inspect` output.

---

### 8️⃣ Session 9: Kubernetes Fundamentals

#### Commands to Run
```bash
cd session9-k8s

# Start Minikube cluster
minikube start --driver=docker

# Check status & cluster info
minikube status
kubectl get nodes
kubectl cluster-info

# Open Kubernetes Dashboard
minikube dashboard
```

#### Final Screenshots to Capture
1. 📷 **`minikube_start_status.png`**: Terminal output of `minikube start` and `minikube status`.
2. 📷 **`kubectl_nodes_clusterinfo.png`**: Terminal output of `kubectl get nodes` and `kubectl cluster-info`.
3. 📷 **`minikube_dashboard.png`**: Browser window open displaying Minikube Kubernetes Web Dashboard GUI.

---

### 9️⃣ Session 10: Kubernetes Core Objects

#### Commands to Run
```bash
cd session10-k8s-core-objects

# Apply Pod & Deployment manifests
kubectl apply -f pod.yml
kubectl apply -f deployment.yml

# Inspect running core objects
kubectl get pods -o wide
kubectl get replicasets
kubectl get deployments

# Expose Deployment via NodePort Service
kubectl expose deployment nginx-deployment --type=NodePort --port=80
kubectl get svc

# Get service URL (in Minikube)
minikube service nginx-deployment --url

# Scale deployment replicas
kubectl scale deployment nginx-deployment --replicas=5
kubectl get pods
```

#### Final Screenshots to Capture
1. 📷 **`kubectl_get_pods_deployments.png`**: Terminal output of `kubectl apply` and `kubectl get pods,rs,deployments`.
2. 📷 **`kubectl_service_nodeport.png`**: Browser window accessing Nginx application via the NodePort service URL.
3. 📷 **`kubectl_scale_replicas.png`**: Terminal output of `kubectl scale deployment nginx-deployment --replicas=5` and `kubectl get pods` showing 5 running pods.

---

## 📝 Final Submission Checklist

- [ ] All code scripts (`system_info.sh`, `Dockerfile`, `*.yml`) are committed and pushed to GitHub.
- [ ] Each session folder contains an updated `README.md` with task overviews, explanations, and embedded screenshot links.
- [ ] Screenshots are saved in `./screenshots/` inside each session folder or uploaded to your submission link.
- [ ] Repository link submitted to official Google Form:
  - **Section A**: `https://forms.gle/ydjAJcwxjpjBXgxB8`
  - **Section B**: `https://forms.gle/pAuXQaokwVzhRzit6`
