
# Inception Project - Docker Infrastructure Setup

## Overview

The **Inception Project** is designed to familiarize you with **Docker** and **system administration** concepts. The project involves setting up an infrastructure of various services using Docker, Docker Compose, and NGINX to build a dynamic website powered by WordPress and MariaDB. The setup is configured in a Virtual Machine to ensure that you can control and customize all services.

This repository contains the necessary files and configurations for setting up the services on a virtual machine, building Docker images, and managing the containers. The project also includes a bonus section where additional services such as Redis, FTP server, and Adminer are integrated.

## Table of Contents

1. [Preamble](#preamble)
2. [Introduction](#introduction)
3. [General Guidelines](#general-guidelines)
4. [Mandatory Part](#mandatory-part)
5. [Bonus Part](#bonus-part)
6. [File Structure](#file-structure)
7. [Environment Setup](#environment-setup)
8. [Running the Project](#running-the-project)
9. [Submission and Peer Evaluation](#submission-and-peer-evaluation)

## Preamble

This project aims to extend your knowledge of Docker and system administration by creating a small infrastructure with several services. You will use Docker Compose to automate the setup and management of containers.

## Introduction

The goal of this project is to set up an infrastructure that involves the following services:

- **NGINX** (acting as the gateway to the infrastructure with TLS)
- **WordPress** + **php-fpm** (without NGINX)
- **MariaDB**
- **Volumes** to store WordPress database and website files
- **Docker Networking** to connect all containers

The services must be configured and managed using Docker Compose, and each service must be built using custom Dockerfiles. Ready-made Docker images should not be pulled from external sources.

## General Guidelines

- The project must be done on a Virtual Machine.
- All configuration files should be placed in the `srcs` folder.
- A `Makefile` is required at the root of your project to automate the setup using `docker-compose.yml`.
- Avoid pulling pre-made images, and write custom Dockerfiles for each service.
- Use environment variables for configuration, and store sensitive information in `.env` files or Docker secrets.

## Mandatory Part

The mandatory tasks for this project include:

1. **NGINX Container**:
   - Configured with only **TLSv1.2** or **TLSv1.3**.
   - Acts as the gateway to the infrastructure through port 443.

2. **WordPress + php-fpm Container**:
   - Running **WordPress** without NGINX.
   - Configured to connect to the MariaDB container.

3. **MariaDB Container**:
   - Contains the database for WordPress without NGINX.

4. **Volumes**:
   - One volume for the **WordPress database**.
   - One volume for **WordPress website files**.

5. **Docker Networking**:
   - A dedicated network to connect all containers.

6. **Security**:
   - Avoid the usage of passwords in Dockerfiles.
   - Use environment variables and Docker secrets for secure configuration.

7. **WordPress Database**:
   - Two users in the database, one being an administrator (non-admin usernames).

## Bonus Part

The bonus tasks add extra features to the infrastructure:

1. **Redis Cache**:
   - Set up a Redis server to improve WordPress caching.

2. **FTP Server**:
   - Configure an FTP server container to point to the WordPress website files.

3. **Static Website**:
   - Set up a simple static website (no PHP).

4. **Adminer**:
   - Integrate Adminer for database management.

5. **Portainer**:
   - Set up Portainer for managing Docker containers via a web UI.

**Note**: Bonus tasks will only be evaluated if all mandatory tasks are correctly implemented.

## File Structure

```bash
.
├── Makefile
├── secrets/
│   ├── credentials.txt
│   ├── db_password.txt
│   ├── db_root_password.txt
├── srcs/
│   ├── docker-compose.yml
│   ├── .env
│   ├── requirements/
│   │   ├── mariadb/
│   │   ├── nginx/
│   │   ├── wordpress/
│   │   ├── bonus/
│   ├── tools/
└── README.md
```

## Environment Setup

### .env Configuration

The `.env` file contains necessary configurations such as:

```env
DOMAIN_NAME=your-login.42.fr
DB_NAME=wordpress
DB_ROOT=rootpass
DB_USER=wpuser
DB_PASS=wppass
FTP_USR=ftpuser
FTP_PWD=ftppass
```

Make sure to replace placeholders with actual values.

## Running the Project

To build and run the project:

1. Clone this repository to your virtual machine.
2. Navigate to the root directory of the project.
3. Build and start the containers with:

```bash
make
```

4. Access your WordPress website by visiting `https://your-login.42.fr` in a web browser.
