# Automated CI/CD Pipeline for Microservices in AWS EKS

This repository demonstrates an end-to-end CI/CD pipeline automation for deploying a microservice application using Jenkins, Docker, AWS ECR, and Kubernetes (EKS). The pipeline automates the following stages:

1. **Build Docker Image**: Build a Docker image from the application code.
2. **Push to ECR**: Push the Docker image to AWS Elastic Container Registry (ECR).
3. **Deploy to EKS**: Deploy the Docker image to a Kubernetes cluster on AWS Elastic Kubernetes Service (EKS).

## Table of Contents
- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [CI/CD Pipeline Details](#cicd-pipeline-details)
- [How to Use](#how-to-use)
- [License](#license)

## Project Overview

This project aims to automate the process of building, testing, and deploying a microservice (Flask app) to a Kubernetes cluster in AWS EKS. The CI/CD pipeline is implemented using Jenkins, Docker, AWS ECR, and Kubernetes.

The project is divided into the following main stages:
- **Build Stage**: Creates a Docker image from the application source code.
- **Push Stage**: Pushes the built Docker image to an AWS ECR repository.
- **Deploy Stage**: Deploys the Docker image to AWS EKS using Kubernetes.

## Architecture

The pipeline leverages several tools and services:
- **Jenkins**: Used for orchestrating the CI/CD pipeline.
- **Docker**: Used to build and manage the containerized application.
- **AWS ECR**: Stores the Docker images securely for later use in EKS.
- **AWS EKS**: Hosts the Kubernetes cluster and deploys the application.
- **Kubernetes**: Manages the deployment and scaling of containers in EKS.

## Prerequisites

Before setting up the CI/CD pipeline, ensure you have the following:
- **AWS CLI** installed and configured with appropriate IAM permissions.
- **Jenkins** setup with required plugins:
  - AWS CLI Plugin
  - Docker Pipeline Plugin
  - Amazon Web Services Credentials Plugin
  - Kubernetes CLI Plugin
- **Docker** installed on your machine.
- **kubectl** configured to interact with your EKS cluster.
- **AWS ECR** repository created for storing Docker images.
- **AWS EKS** cluster setup for deploying the application.

## Setup Instructions

1. **Clone the Repository**
   Clone this repository to your local machine.

   ```bash
   git clone https://github.com/TheSumanta365/Microservices-CI-CD-pipeline-automation.git
   cd Microservices-CI-CD-pipeline-automation
