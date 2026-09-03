# Session 9: Kubernetes (K8s) Architecture & Basics

## Overview
This session introduces Kubernetes (K8s), the industry-standard container orchestration platform. It covers Kubernetes architecture, Minikube local development setup, `kubectl` CLI commands, and Control Plane vs. Worker Node components.

---

## Kubernetes Architecture Overview

Kubernetes follows a master-worker architecture divided into the **Control Plane** (Master Node) and **Worker Nodes**.

```
 +-----------------------------------------------------------------------+
 |                            CONTROL PLANE                              |
 |  +---------------+   +-------------------+   +---------------------+  |
 |  |   kube-apiserver  |   |  etcd datastore   |   | kube-scheduler      |  |
 |  +---------------+   +-------------------+   +---------------------+  |
 |  | kube-controller-manager                 |                          |
 |  +-----------------------------------------+                          |
 +-----------------------------------------------------------------------+
                                    |
          +-------------------------+-------------------------+
          |                                                   |
 +----------------------------------+       +----------------------------------+
 |           WORKER NODE 1          |       |           WORKER NODE 2          |
 | +------------+  +--------------+ |       | +------------+  +--------------+ |
 | |   kubelet  |  |  kube-proxy  | |       | |   kubelet  |  |  kube-proxy  | |
 | +------------+  +--------------+ |       | +------------+  +--------------+ |
 | |    Container Runtime (CR)    | |       | |    Container Runtime (CR)    | |
 | +------------------------------+ |       | +------------------------------+ |
 | |  [ Pod A ]    [ Pod B ]      | |       | |  [ Pod C ]    [ Pod D ]      | |
 +----------------------------------+       +----------------------------------+
```

---

## Key Components Breakdown

### 1. Control Plane Components
- **kube-apiserver**: Front-end REST API gateway for all cluster operations; exposes the Kubernetes API.
- **etcd**: Consistent, highly-available key-value store holding all cluster state and configuration data.
- **kube-scheduler**: Assigns unscheduled Pods to optimal Worker Nodes based on resource requirements.
- **kube-controller-manager**: Runs controller loops managing node state, replication, endpoints, and service accounts.

### 2. Worker Node Components
- **kubelet**: Agent running on each node ensuring containers described in PodSpecs are running and healthy.
- **kube-proxy**: Maintains network routing rules on nodes to allow network communication to Pods.
- **Container Runtime**: Software responsible for running containers (e.g. `containerd`, CRI-O, Docker).

---

## Minikube Setup & Commands

Minikube creates a local single-node Kubernetes cluster for testing and development.

```bash
# 1. Start Minikube cluster
minikube start --driver=docker

# 2. Check cluster status
minikube status

# 3. View node details using kubectl
kubectl get nodes

# 4. View cluster info
kubectl cluster-info

# 5. Open Minikube Dashboard
minikube dashboard
```

### Task Screenshots & Evidence
![Screenshot: minikube start and status execution output](./screenshots/minikube_start_status.png)
![Screenshot: kubectl get nodes and cluster-info output](./screenshots/kubectl_nodes_clusterinfo.png)
![Screenshot: Minikube Web Dashboard GUI in Browser](./screenshots/minikube_dashboard.png)

---

## Useful Resources
- [Kubernetes Basics Official Tutorial](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
- [Minikube Installation Guide](https://minikube.sigs.k8s.io/docs/start/)
- [Kubernetes Architecture Concepts](https://kubernetes.io/docs/concepts/architecture/)
- [Community Kubernetes Notes Repo](https://github.com/Nency-Ravaliya/Kubernetes)