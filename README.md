# Secure-CRUD

Secure-CRUD is a production-style multi-container CRUD system built using Node.js, MongoDB, and Nginx.  
It demonstrates reverse proxy architecture, container isolation, persistent storage, non-root containers, and CI/CD automation.

---

## 🏗 System Architecture

The system consists of three services running in a private Docker network:

| Service  | Technology | Role |
|----------|------------|------|
| Proxy    | Nginx      | Gatekeeper. Receives all traffic on port 80 and routes it to the App |
| App      | Node.js    | Handles CRUD logic and communicates with the database |
| Database | MongoDB   | Persists application data using a Docker volume |

**Security Design:**
- App and Database containers are not exposed to the host
- Only the Nginx proxy maps a host port (80)
- App container runs as a non-root user
- Database credentials are injected via environment variables

---

## 🚀 Features

- Full CRUD API for Task records
- Health check endpoint
- Reverse proxy using Nginx
- Private Docker networking
- Persistent MongoDB storage using volumes
- Non-root application container
- One-command deployment using `deploy.sh`
- Automated Docker image publishing (CI/CD)

---

## 🛠 Tech Stack

- Node.js (Express)
- MongoDB
- Nginx
- Docker & Docker Compose
- GitHub Actions

---

## 📁 Repository Structure

```plaintext
.
├── src/                 # App source code
├── nginx/              # Nginx configuration files
├── docker-compose.yml  # Orchestration file
├── Dockerfile          # App container instructions
├── deploy.sh           # Automation script
└── README.md           # Setup instructions & Docker Hub link
## ⚙️ Setup & Run

### Prerequisites

- Docker  
- Docker Compose  

---

### One-Command Deployment

```bash
./deploy.sh
Expected output:

```text
[SUCCESS] Application is live at http://localhost
## 🔍 API Endpoints

| Method | Endpoint        | Description    |
|--------|-----------------|----------------|
| GET    | /health         | Health check   |
| POST   | /tasks          | Create task    |
| GET    | /tasks          | Get all tasks  |
| PUT    | /tasks/:id      | Update task    |
| DELETE | /tasks/:id      | Delete task    |
## 🐳 Docker Hub Image

Public Docker image:  
https://hub.docker.com/r/anwinantino/secure-crud
