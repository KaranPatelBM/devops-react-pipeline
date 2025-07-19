# DevOps React Pipeline on AWS (Terraform + Jenkins + EKS)

![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/Container-Docker-2496ED?logo=docker&logoColor=white)
![Jenkins](https://img.shields.io/badge/CI-Jenkins-D24939?logo=jenkins&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Orchestration-Kubernetes-326CE5?logo=kubernetes&logoColor=white)
![React](https://img.shields.io/badge/Frontend-React-61DAFB?logo=react&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?logo=amazonaws&logoColor=white)

---

## ✨ Project Overview

A production-grade DevOps workflow that provisions AWS infrastructure with Terraform, installs Jenkins on an EC2 instance, and deploys a containerized React counter application to an EKS cluster — perfect for showcasing CI/CD and cloud-native practices.

---

## 🔧 Tech Stack

- **Frontend**: React (Vite)
- **CI/CD**: Jenkins (on EC2)
- **Infrastructure**: AWS EKS, EC2, IAM, VPC (via Terraform)
- **Containerization**: Docker
- **Monitoring**: Prometheus, Grafana, Datadog (optional)
- **Deployment**: Kubernetes

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

## 📁 Project Structure

```bash
fullstack-devops-pipeline/
├── Terraform/
│   ├── AWS_eks-project/       # Terraform code to provision EKS, EC2, IAM, VPC
│   └── Jenkins_Server/        # Jenkins installation script and EC2 setup
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

## 🔧 Future Enhancements

- [ ] Convert Kubernetes YAMLs into full Helm Charts
- [ ] Push Docker images to AWS ECR
- [ ] Automate Jenkins-to-EKS deployment pipeline
- [ ] Add monitoring with Prometheus + Grafana
- [ ] Optional integration with Datadog for advanced observability


---

## 🚀 Author

**Karan Patel**
GitHub: [@KaranPatelBM](https://github.com/KaranPatelBM)

---

> ✅ This project demonstrates your ability to implement a full DevOps lifecycle using industry tools, automation, cloud infrastructure, and CI/CD best practices.

