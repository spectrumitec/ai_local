# AI Local System

This project is focused toward a use for proof of concept (POC), testing and a starting point for learning AI and tools with AI model software. This project lends fairly well to portable installations on laptop or desktop PC. This is not meant for production workloads.

## What You Need To Start

Assuming you are using a local PC or laptop that already has a GPU card installed (NVIDIA or AMD), these are a few tool installs needed to begin.

Docker Components for container deployment needed for this project:

- Docker Desktop: https://www.docker.com/get-started/

(Optional) Git tools. Manual download and extract possible from Github which doesn't need the git tools.

- Git:
  - Windows: https://git-scm.com/install/windows
  - Mac: https://git-scm.com/install/mac
  - Linux: https://git-scm.com/install/linux
- Git for Windows: https://gitforwindows.org/

(Optional) AI software tools (Local AI models):

- LM Studio for AI models: https://lmstudio.ai/download
- Ollama for AI models: https://www.ollama.com/download

<b>NOTE</b>: It is also possible to have LM Studio or Ollama installed on different systems as long as you can reach them over the network. This might work well if you have access to one or more systems with GPUs installed that you may want to take advantage of or test different AI model software.

You can also use cloud based AI tools like OpenAI, etc. Cloud hosted is subject to costs as per services.

## Help With Initial AI Tools Installation Locally

If you need some help to install and configure, you can use the '\_HowTos' folder above with helpers on how to install and configure.

<a href="https://github.com/spectrumitec/ai_local/blob/main/_HotTos/1_LM_Studio.md" target="_blank">LM Studio Install and Configure</a>

## Basic Install and Setup of this Repository

LM Studio or Ollama (or cloud AI services) are not yet needed at this stage of setup. It wll only be needed once using some of the applications in this repository, like 'n8n', which has AI agent nodes and functions that need to leverage AI software.

1. After installing Docker Desktop or Docker create a new folder for housng this repository files

2. There are two way to pull down the Git repository. Either use a 'git' tool to clone the repository to a folder or download the zip file and extract it to a folder. Start by creating a folder you want to use for this project.

<img src="_HotTos/_images/readme-01-github.png">

If using the 'git' tool, open a terminal, navigate to the folder and run the following command.

<pre>
git clone https://github.com/spectrumitec/ai_local.git .
</pre>

The following folder structure pulled from the repository or extracted from the zip file.

<pre>
  new_folder
    ├ _HowTos               How To doc helpers and samples
    ├ _configs              Holds confiuration files, SSL certificates, and some container scripts
    ├ .env                  Default variables for compose file (default user and passwords)
    ├ .gitignore            Ignore file for excluding folders when pushed to a git repo
    ├ README.md             This file
    ├ docker-compose.yml    Docker compose file (application startup)
    └ hosts                 Required to add to your laptop or desktop hosts file (URL resolution to local names)
</pre>

3. Run the docker compose from the command line to deploy this repository. You will see the application containers pull and install. The containers will be managable from the Docker Desktop application.

Open a terminal, navigate to the folder where the repository is located and run the following command.

<pre>
docker compose -f ./docker-compose.yaml up -d
</pre>

If needed, see the Docker Desktop helpers for more details of this step: https://github.com/spectrumitec/ai_local/blob/main/_HotTos/2_Docker_Desktop_Setup.md

4. Your local system running these containers will need to have the following hosts file entries added.

<pre>
# Add to hosts file
127.0.0.1   insight.local       # REDIS chat memory database (admin)
127.0.0.1   adminer.local       # Common Web Admin for MySQL, MariaDB, Postgres, etc
127.0.0.1   pgadmin.local       # PGAdmin local
127.0.0.1   phpmyadmin.local    # PHPMyAdmin
127.0.0.1   attu.local		      # Milvus Admin
127.0.0.1   minio.local		      # MinIO S3 bucket admin
127.0.0.1   n8n.local		        # Workflow application
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
