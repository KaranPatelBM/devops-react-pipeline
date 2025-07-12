# Fullstack DevOps Pipeline
End-to-end CI/CD pipeline for a web app (React) using Terraform, Docker, Jenkins, Kubernetes, Prometheus, Grafana, and Datadog(optional).

This project demonstrates a complete DevOps pipeline from code to production using:

* **React** (Vite-based frontend)
* **Jenkins** (Installed directly on EC2 instance)
* **AWS EKS** (Infrastructure as Code via Terraform)
* **Docker** (for containerization)

---

## ✨ Project Overview

A production-ready workflow that provisions cloud infrastructure, installs Jenkins directly on an EC2 instance, and deploys a simple React counter application to AWS EKS. Perfect for showcasing DevOps practices in cloud-native environments.

---

## 🛀 Architecture Diagram

```text
                                +--------------------+
                                |   Developer GitHub |
                                +--------------------+
                                          |
                                   Git Push / PR
                                          |
                                  +---------------+
                                  |    Jenkins    |
                                  | (On EC2)      |
                                  +---------------+
                                          |
                       +------------------+------------------+
                       |                                     |
             Docker Build & Test                   Terraform Apply
                       |                                     |
        +-------------------------+       +--------------------------------+
        | Docker Image: React App |       | AWS Infrastructure Provisioned |
        +-------------------------+       |  - VPC, EKS, EC2, SG           |
                       |                 +--------------------------------+
                       |
         +-----------------------------+
         |  AWS EKS Cluster (K8s)      |
         | - Deploy React App Pod      |
         +-----------------------------+
                       |
               App available via ELB
```

---

## 🔄 Folder Structure

```bash
fullstack-devops-pipeline/
├── Terraform/
│   ├── AWS_eks-project/       # Terraform code to provision EKS + EC2 + IAM
│   └── Jenkins_Server/        # Jenkins installation script and config for EC2
├── React-Counter-App/         # Vite-based React frontend
│   ├── helm/                  # K8s deployment and service manifests
│   ├── public/
│   ├── src/
│   ├── .gitignore
│   ├── Dockerfile
│   ├── eslint.config.js
│   ├── index.html
│   ├── jenkinsfile
│   ├── package-lock.json
│   ├── package.json
│   └── vite.config.js
└── README.md
```

---

## ⚙️ How to Run

### 1. Provision Infrastructure on AWS

```bash
cd Terraform/AWS_eks-project
terraform init
terraform apply
```

> This creates:
>
> * VPC, Subnets, Internet Gateway
> * EKS Cluster
> * EC2 instance for Jenkins

---

### 2. Install Jenkins on EC2 Instance

SSH into your EC2 instance:

```bash
ssh -i <your-key.pem> ubuntu@<ec2-public-ip>
```

Run the Jenkins install script:

```bash
cd Terraform/Jenkins_Server
chmod +x install-jenkins.sh
./install-jenkins.sh
```

> Access Jenkins at `http://<your-ec2-ip>:8080`

---

### 3. Build and Run React App

```bash
cd React-Counter-App
docker build -t react-counter-app .
docker run -p 3000:3000 react-counter-app
```

> The app will be running at `http://localhost:3000`

---

## 🔵 Technologies Used

* **React** (Vite)
* **Docker**
* **Terraform**
* **Jenkins on EC2**
* **AWS EC2 + EKS + IAM**
* **Kubernetes (YAML-based Helm-style structure)**

---

## ✨ Future Improvements

* [ ] Convert raw Kubernetes YAMLs to full Helm chart format
* [ ] Use ECR for Docker image registry
* [ ] Automate deployment from Jenkins to EKS
* [ ] Add Prometheus + Grafana monitoring

---

## 🚀 Author

**Karan Patel**
GitHub: [@KaranPatelBM](https://github.com/KaranPatelBM)

---

> ✅ This project demonstrates your ability to implement a full DevOps lifecycle using industry tools, automation, cloud infrastructure, and CI/CD best practices.

