# Session 10: Kubernetes Core Objects

## Overview
This session covers Kubernetes Core Objects (Pods, ReplicaSets, Deployments, and Services), YAML manifest syntax, object lifecycle management, and application scaling via `kubectl`.

---

## Kubernetes Core Objects Breakdown

### 1. Pod (`pod.yml`)
- The smallest deployable unit in Kubernetes.
- Encapsulates one or more co-located containers, shared storage volumes, and network IP address.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
    - name: nginx
      image: nginx:latest
      ports:
        - containerPort: 80
```

---

### 2. ReplicaSet (`replicaset.yml`)
- Ensures a specified number of Pod replicas are running at any given time.
- Uses label selectors to manage active pods.

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx-replicaset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:latest
```

---

### 3. Deployment (`deployment.yml`)
- Provides declarative updates for Pods and ReplicaSets.
- Handles rolling updates, rollbacks, self-healing, and dynamic replica scaling.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.25
          ports:
            - containerPort: 80
```

---

## Deployment & Verification Commands

```bash
# 1. Apply Pod manifest
kubectl apply -f pod.yml

# 2. Apply Deployment manifest
kubectl apply -f deployment.yml

# 3. Check status of all resources
kubectl get pods
kubectl get replicasets
kubectl get deployments

# 4. Expose Deployment as NodePort Service
kubectl expose deployment nginx-deployment --type=NodePort --port=80

# 5. Scale Deployment replicas dynamically
kubectl scale deployment nginx-deployment --replicas=5

# 6. Delete resources
kubectl delete -f deployment.yml
```

### Task Screenshots & Evidence
![Screenshot: kubectl apply and kubectl get pods/deployments output](./screenshots/kubectl_get_pods_deployments.png)
![Screenshot: kubectl expose service and NodePort accessibility in browser](./screenshots/kubectl_service_nodeport.png)
![Screenshot: Dynamic replica scaling output via kubectl scale](./screenshots/kubectl_scale_replicas.png)

---

## Useful Resources
- [Kubernetes Core Objects Guide](https://github.com/Nency-Ravaliya/Kubernetes/blob/main/core-objects.md)