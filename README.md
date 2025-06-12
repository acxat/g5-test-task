# Docker Logging & Monitoring with Fluent Bit + Ansible

This project sets up log collection from Docker containers using **Fluent Bit**, and monitoring with **Prometheus** and **Grafana**, deployed via **Docker Compose**.

---

##  Components

- **Docker Compose**
  - Launches application containers
  - Deploys **Prometheus** (port is closed)
  - Deploys **Grafana** (port `80`)
- **Fluent Bit**
  - Reads logs from `/var/lib/docker/containers/*/*.log`
  - Stores logs in `/var/log/test`
- **Ansible**
  - Installs and configures Fluent Bit

---

## Project structure

```
.
├── ansible
│   ├── become_pass      # Store your sudo password here
│   ├── fluent-bit.conf  # Fluent Bit configs
│   ├── parsers.conf
│   └── playbook.yml     # Playbook to install Fluent Bit
├── deploy.sh            # Autostart script
├── docker-compose.yml   # Prometheus, Grafana, and app containers
├── grafana              # Grafana configs
│   └── provisioning
│       ├── dashboards
│       │   ├── dashboards.yml
│       │   └── json
│       │       └── fluent-bit.json
│       └── datasources
│           └── prometheus.yml
├── prometheus.yml       # Prometheus configs
└── README.md
```

---

> **Note:**
> Create a file named `ansible/become_password` and store the current user's `sudo` password in plain text.  
> This is used for privilege escalation during Ansible execution.

---

## Quick Start

```bash
chmod +x deploy.sh
./deploy.sh
```

---

## Access

    Grafana: http://localhost (port 80)

        Default login: admin / admin

    Prometheus: not accessible externally (port closed in docker-compose.yml)

---

## Requirements

    Ubuntu 24.04+

    Docker and Docker Compose

    Ansible 2.10+
