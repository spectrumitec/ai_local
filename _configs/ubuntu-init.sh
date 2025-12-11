#!/bin/bash

# Install python3
echo ""
echo "Container Startup"
echo " > Update and install python"
apt update > /dev/null 2>&1
apt install -y python3 > /dev/null 2>&1

# Create HTML file
if [ ! -d "/www" ] ; then
    mkdir /www
fi
echo " > Create or update HTML launch pad file"
cat > /www/index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Localhost AI Application Set</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #222222;
            color: white;
        }
        a {
            color: white;
        }
        a:visited {
            color: white;
        }
        a:hover {
            color: blue;
        }
    </style>
</head>
<body>
    <h1>AI Application Set</h1>
    <p>
        See github readme for configuration setup for hosts file resolution, AI local model options.
    </p>
    <hr />
    <h2>Workflow Services</h2>
    <ul>
        <li><a href="https://n8n.local" target="_blank">n8n Workflow System</a></li>
    </ul>
    <h2>Admin Services</h2>
    <ul>
        <li><a href="https://insight.local" target="_blank">REDIS Insight</a></li>
        <li><a href="https://pgadmin.local" target="_blank">Postgres pgAdmin</a></li>
        <li><a href="https://phpmyadmin.local" target="_blank">MariaDB phpMyAdmin</a></li>
        <li><a href="https://adminer.local" target="_blank">Adminer (alternate DB Admin)</a></li>
        <li><a href="https://attu.local" target="_blank">Milvus Admin</a></li>
        <li><a href="https://minio.local" target="_blank">Milvus S3 Bucket Admin</a></li>
    </ul>
    <h2>HAproxy State</h2>
    <ul>
        <li><a href="http://localhost:1024/" target="_blank">HAproxy Stats</a></li>
    </ul>
    <h2>Container Hosts Resolution - Reference</h2>
    <pre>
    Dockernet IP Address      Hostname
    --------------------      --------

    Dockernet hosts entry
    127.0.0.1	              localhost
    172.18.0.2	              haproxy

    Admin panels
    172.18.0.10	              redisinsight
    172.18.0.11	              adminer
    172.18.0.12	              pgadmin
    172.18.0.13	              phpmyadmin
    172.18.0.14	              attu

    Workflow
    172.18.0.20	              n8n

    Databases
    172.18.0.30	              redis
    172.18.0.31	              mariadb
    172.18.0.32	              postgres

    Vector Store
    172.18.0.40	              etcd
    172.18.0.41	              minio
    172.18.0.42	              milvus
    </pre>
</body>
</html>
EOF

# Post client
if [ ! -f "/tmp/pgclient" ]; then
    echo " > install Postgres DB client"
    apt install -y \
        sudo \
        dirmngr \
        ca-certificates \
        software-properties-common \
        apt-transport-https \
        lsb-release \
        curl > /dev/null 2>&1
    curl -fSsL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | sudo tee /usr/share/keyrings/postgresql.gpg > /dev/null
    echo deb [arch=amd64,arm64,ppc64el signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main | sudo tee /etc/apt/sources.list.d/postgresql.list
    apt update > /dev/null 2>&1
    apt install -y postgresql-client-15 > /dev/null 2>&1
    psql --version
    touch /tmp/pgclient
else
    echo " > Postgres DB client already installed"
    psql --version
fi

# MariaDB client
if [ ! -f "/tmp/mdbclient" ]; then
    echo " > install MariaDB client"
    curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash -s -- --mariadb-server-version=11.8 > /dev/null
    apt update > /dev/null 2>&1
    apt install -y mariadb-client > /dev/null 2>&1
    mariadb --version
    touch /tmp/mdbclient
else
    echo " > MariaDB client already installed"
    mariadb --version
fi

# Start web service
echo ""
echo "Start python web services -- https://localhost/"
echo "═══════════════════════════════════"
cd /www
python3 -m http.server 80
