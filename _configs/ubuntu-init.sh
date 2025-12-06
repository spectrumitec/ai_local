#!/bin/bash

# Install python3
echo "Update and install python"
apt update > /dev/null 2>&1
apt install -y python3 > /dev/null 2>&1

# Create HTML file
echo "Create HTML launch pad file"
mkdir /www
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
        <li><a href="https://adminer.local" target="_blank">Basic MySQL, Postgres admin</a></li>
        <li><a href="https://pgadmin.local" target="_blank">Postgres pgAdmin</a></li>
        <li><a href="https://phpmyadmin.local" target="_blank">MariaDB phpMyAdmin</a></li>
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

# Start web service
echo "Start python web services"
cd /www
python3 -m http.server 80
