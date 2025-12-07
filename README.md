# AI Local System

This project is focused toward a use for proof of concept (POC), testing and a starting point for learning AI and tools with AI model software. This project lends fairly well to portable installations on laptop or desktop PC. This is not meant for production workloads.

## What You Need To Start

Assuming you are using a local PC or laptop that already has a GPU card installed (NVIDIA or AMD), these are a few tool installs needed to begin.

AI software for models:

- LM Studio for AI models: https://lmstudio.ai/download
- Ollama for AI models: https://www.ollama.com/download

<b>NOTE</b>: It is also possible to have LM Studio or Ollama installed on different systems as long as you can reach them over the network. This might work well if you have access to one or more systems with GPUs installed that you may want to take advantage of or test different AI model software.

Docker Components for container deployment:

- Docker Desktop: https://www.docker.com/get-started/

Optional Git tools.

- Git:
  - Windows: https://git-scm.com/install/windows
  - Mac: https://git-scm.com/install/mac
  - Linux: https://git-scm.com/install/linux
- Git for Windows: https://gitforwindows.org/

## Help With Installation

If you need some help to install and configure, you can use the '\_HowTos' folder above with helpers on how to install and configure.

## Basic Install and Setup

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
