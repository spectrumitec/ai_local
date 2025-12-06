# AI Local System

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
- LM Studio (AI models) - more models availalbe
- Ollama (Linux or Mac where LM Studio is not available)

Optional use of Ollama however there is less support for Milvus embedding models (at current time)

## Configuration

From a command line, create a folder to launch docker containers, change to working folder, and clone this repository.

<pre>
git clone https://github.com/spectrumitec/ai_local.git .
</pre>

The '\_configs' folder contains the following:

- SSL certificate used for HAproxy and some containers (can be replaced with trusted certs)
- Container hosts file mapped to each container.

The compose file configures a 'dockernet' network with subnet of 172.18.0.0/24. Each container has an assigned IP address. HAproxy port 80 and 443 are exposed and the configuration uses ACL to resolve URL (below hosts entry) to web services running on the containers. MariaDB port is exposed for use with MySQL or MAriaDB clients.

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

## n8n Configuration

To be completed
