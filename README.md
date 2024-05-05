# Project Name

DevEnv Wildfly

## Table of Contents

- [Project Name](#project-name)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Usage](#usage)

## About

The achieve of this project is to create a full dev environment containing jboss and DB runnable with a simple command with little setup needed

## Getting Started

To get started with this project, follow the steps below:

### Prerequisites

Before you begin, make sure you have the following prerequisites installed on your system:

1. **Docker**: You can download and install Docker from [Docker's official website](https://www.docker.com/get-started).

### Installation

Follow these steps to set up and run the development environment:

1. **Clone the Repository**: Clone this repository to your local machine using Git
2. **Navigate to project folder**
3. **Edit configuration files**: edit docker compose to change db name, username password and wildfly running mode
4. **Add all the jdbc needed**: put all the jdbcs jars into the jdbc-drivers folder
5. **Edit domain file**: edit domain.xml file changing datasourceName and PostgresDb name. Eventually copying DS and Driver in the other profiles (only *FULL-HA* actually compiled).
6. **Edit .env file**: edit .env file configuring details regard postgres db
6. **Run the Launch Script**: edit script to change (if wanted) name of the container end ther run it with ``` ./launch.sh```

## Usage

Here's how you can use this project:

- **Management User**: A management user with the credentials `admin` (username) and `admin` (password) is created for the WildFly server.

- **Accessing Management Console**: You can access the WildFly management console by opening your web browser and navigating to [http://localhost:9990](http://localhost:9990). Use the `admin` credentials to log in.

- **Accessing WildFly**: WildFly itself is accessible at [http://localhost:8080](http://localhost:8080) in your web browser.

- **Database Access**: The database is running and exposed outside the container, allowing you to connect to it using applications like DBeaver or any other database management tool. You can use the following connection details (if not changed on _docker-compose.yaml_ file):

   - **Host**: `localhost`
   - **Port**: `5432` (or the appropriate port)
   - **Database Name**: `devel_db`
   - **Username**: `postgres`
   - **Password**: `postgres`
