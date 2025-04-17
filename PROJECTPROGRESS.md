# Local Setup & Integration Testing

## Changes Made

### Backend Environment Variables
- **MongoDB Connection String:**  
  - **Before:**  
    `mongodb://root:example@mongo:27017/expensy`
  - **After:**  
    `mongodb://root:example@localhost:27017/expensy?authSource=admin`  
    This change ensures that the backend resolves MongoDB on `localhost` rather than `mongo`, and the added `?authSource=admin` ensures that authentication checks against the admin database where the root user was created by the MongoDB container.

### Integration Testing
- **MongoDB:**  
  - Verified that the backend connects successfully to MongoDB.
- **Redis:**  
  - Confirmed connectivity by pinging Redis (receiving `PONG` from `redis-cli`).
- **Frontend:**  
  - Ran the frontend and tested the complete flow by adding an expense, verifying that the integration between frontend and backend works as expected.

## Rationale
- **Accurate Database Resolution:**  
  Updating the connection string to `localhost` ensures that the MongoDB instance running in a Docker container is correctly reached from the backend.
- **Proper Authentication:**  
  Adding `?authSource=admin` guarantees that the authentication happens against the correct database (admin), where the credentials were set up during container initialization.
- **Reliable Integration:**  
  Successful connections to both MongoDB and Redis, along with a working frontend that can add an expense, confirm that our local development environment is fully integrated and functional.

# Prometheus Monitoring Setup

Focused on integrating Prometheus monitoring into the EKS cluster setup. Created a monitoring/ folder containing the core configuration files (prometheus.yml and alert-rules.yml) to define scrape jobs (node‑exporter, kube‑state‑metrics, cAdvisor) and custom alerts (HighNodeCPUUsage, PodNotReady). Developed Kubernetes manifests under k8s/prometheus/, including two ConfigMaps (one for the main Prometheus config, one for alert rules), a ServiceAccount, a Deployment that mounts those ConfigMaps alongside an emptyDir volume for storage, and a LoadBalancer Service to expose the Prometheus UI on port 80. Applied each manifest with kubectl apply, monitored the rollout, and confirmed that the Prometheus pod reached a healthy running state. Tested the external LoadBalancer DNS for the /graph and /-/healthy endpoints, troubleshooting storage and endpoint binding issues along the way.