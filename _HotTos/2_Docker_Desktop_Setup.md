# Docker Setup and Initial Deployment (PC)

NOTE: See README.md on main page for initial setup. These steps are repeated except have some images for reference.

## Docker Setup and Deploy on PC

Download and install Docker (https://www.docker.com/get-started/)

<img src="_images/docker_1_setup.png" alt="" />

<img src="_images/docker_2_setup.png" alt="" />

## Launch the Docker Desktop Application and Login

<img src="_images/docker_3_launch.png" alt="" />

<img src="_images/docker_4_launch.png" alt="" />

## Initial Deployment

Reference to README on root page:

- Create a folder
- Open a console
- Navigate to folder
- Git pull repository
- Run the deployment command

<pre>
git clone https://github.com/spectrumitec/ai_local.git .
</pre>
<pre>
docker compose -f ./docker-compose.yaml up -d
</pre>

<img src="_images/docker_5_deploy.png" alt="" />

<img src="_images/docker_6_deploy.png" alt="" />

<img src="_images/docker_7_deploy.png" alt="" />

## Localhost and Dashboard

Open 'http://localhost' to see initial dashboard

<img src="_images/docker_8_localhost.png" alt="" />

On dashboard is a stats page for making sure services are running and HAproxy sees everything as up state (green)

<img src="_images/docker_9_stats.png" alt="" />
