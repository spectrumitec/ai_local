# AI Local System

This is not intended for production use. It is focused toward use for proof of concept (POC), testing and a starting point for learning AI and tools. This project lends fairly well to portable installations on laptop or desktop PC. At minimum can be installed on a Windows PC with Docker Desktop and paired up with LM Studio. This will deploy a set of commonly used applications and databases. Some application containers software may need to be configured post deployment like n8n, database management, etc.

## Overview

Docker compose for deploying an AI application set for a local system. The following container deployment will deploy from compose.

- HAproxy (localhost port 80 / 443)
- n8n Workflow
- REDIS memory DB
- Postgres SQL
- MariaDB SQL
- Milvus vector store

<u>Required</u>

- Docker Desktop (windows / Mac)
- Docker (Linux / Mac)
- Git tools if not installed

<u>AI Model Loaders</u>

AI Containers are not included by default due to varying configurations. Ollama or vLLM can be added to the compose file after download. LM Studio can be installed and can leverage the web services built into the client. AI containers or application may be installed on other systems from this deployment.

- LM Studio (AI models) - more models availalbe
- Ollama (Linux or Mac where LM Studio is not available)

## Install and Setup

After installing Docker Desktop or Docker, create a new folder for housng the application set. From a command line, change to the folder that was created and run the git command below.

<pre>
git clone https://github.com/spectrumitec/ai_local.git .
</pre>

The following folder structure pulled from the repository

<pre>
  new_folder
    ├ _configs              Holds confiuration files, SSL certificates, and some container scripts
    ├ _images               Image folder for README.md file
    ├ application           Folder where container mounts are created other than HAproxy
    ├ haproxy               HAproxy specific files
    ├ .env                  Default variables for compose file (default user and passwords)
    ├ .gitignore            Ignore file for excluding folders when pushed to a git repo
    ├ docker-compose.yml    Docker compose file (application startup)
    ├ hosts.txt             Required to add to your laptop or desktop hosts file (URL resolution to local names)
    └ README.md             This file
</pre>

The compose file configures a 'dockernet' network with subnet of 172.18.0.0/24. Each container has an assigned IP address. HAproxy port 80 and 443 are exposed and the configuration uses ACL to resolve URL (below hosts entry) to web services running on the containers. MariaDB and Postgres ports are exposed for use external Database management tools.

The following should be added to your system hosts file for URL mapping in HAproxy:

<pre>
# Add to hosts file
127.0.0.1   insight.local       # REDIS chat memory database (admin)
127.0.0.1   adminer.local       # Common Web Admin for MySQL, MariaDB, Postgres, etc
127.0.0.1   pgadmin.local       # PGAdmin local
127.0.0.1   phpmyadmin.local    # PHPMyAdmin
127.0.0.1   attu.local		    # Milvus Admin
127.0.0.1   minio.local		    # MinIO S3 bucket admin
127.0.0.1   n8n.local		    # Workflow application
</pre>

To startup, run command from the command line:

<pre>
docker compose -f ./docker-compose.yaml up -d
</pre>

From docker desktop, you should see the running containers start up. Additional folders will be created for the containers.

## Start page

After a few minutes post startup, you access https://localhost to see an available menu of services

## HowTos and Helpers

See '\_HowTos' folder
