# Secure-CRUD

**Secure-CRUD** is a production-style multi-container CRUD system built using Node.js, MongoDB, and Nginx. It demonstrates reverse proxy architecture, container isolation, persistent storage, non-root containers, and CI/CD automation.

---

## System Architecture

The system consists of three services running within a private Docker network to ensure maximum isolation.



| Service | Technology | Role |
| :--- | :--- | :--- |
| **Proxy** | Nginx | Receives all traffic on port 80 and routes it to the App. |
| **App** | Node.js | Handles CRUD logic and communicates with the database. |
| **Database** | MongoDB | Persists application data using a Docker volume. |

### Security Design
* **App and Database** containers are not exposed to the host machine.
* Only the **Nginx proxy** maps to a host port (80).
* The App container runs as a **non-root user** to minimize exploit surface.
* Database credentials are securely injected via **environment variables**.

---

## Features

* **Full CRUD API:** Comprehensive endpoints for Task management.
* **Reverse Proxy:** Managed via Nginx for secure traffic routing.
* **Container Isolation:** Private Docker networking prevents direct DB access.
* **Data Persistence:** Persistent MongoDB storage using Docker volumes.
* **Security First:** Non-root application containers and slim base images.
* **One-Command Deployment:** Simplified setup via `deploy.sh`.
* **CI/CD:** Automated Docker image publishing to Docker Hub.

---

## Tech Stack

* **Backend:** Node.js (Express)
* **Database:** MongoDB
* **Proxy:** Nginx
* **Orchestration:** Docker & Docker Compose
* **Automation:** GitHub Actions & Bash scripts

---

## Repository Structure

```text
.
├── src/                # App source code
├── nginx/              # Nginx configuration files
├── docker-compose.yml  # Orchestration file
├── Dockerfile          # App container instructions
├── deploy.sh           # Automation script
└── README.md           # Setup instructions & Docker Hub link
