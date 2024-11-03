# Node.js Application with CI/CD and Kubernetes

This repository contains a sample Node.js application with a CI/CD pipeline using GitHub Actions to automate testing, building, and deploying to a local Kubernetes cluster using Minikube. The project demonstrates how to containerize the application, deploy it to Kubernetes, and automate the entire deployment process using GitHub Actions.

## Overview

The project aims to accomplish the following:

1. **Dockerize** the Node.js application for containerized deployment.
2. Create **Kubernetes manifests** to deploy the application with multiple replicas and expose it via a Service.
3. Set up a **CI/CD pipeline** using GitHub Actions to:
   - Build the Docker image.
   - Run tests for the application.
   - Push the Docker image to a registry.
   - Deploy the image to a Kubernetes cluster.

## Project Structure

- **`app/`**: Contains the source code of the Node.js application, including `package.json`.
- **`Dockerfile`**: Used for building the Docker image of the application.
- **`k8s/`**: Contains Kubernetes manifests for deployment and service:
  - `deployment.yaml`: Manages the deployment of the application with two replicas.
  - `service.yaml`: Exposes the application using a LoadBalancer service.
- **`.github/workflows/deploy.yaml`**: GitHub Actions workflow that automates building, testing, and deploying the application.

## Prerequisites

- **Docker**: Installed on your machine to build and run containers.
- **Minikube**: To create a local Kubernetes cluster for testing.
- **kubectl**: Command-line tool to interact with Kubernetes.
- **GitHub Account**: To create a repository and set up GitHub Actions.

## Running Locally

1. **Clone the Repository**:
   ```sh
   git clone <repository-url>
   cd <repository-name>
   ```

2. **Build the Docker Image**:
   ```sh
   docker build -t my-node-app .
   ```

3. **Run the Application Locally**:
   ```sh
   docker run -p 3000:3000 my-node-app
   ```
   - Access the app at `http://localhost:3000`.

## Deploying to Minikube

1. **Start Minikube**:
   ```sh
   minikube start
   ```

2. **Apply Kubernetes Manifests**:
   ```sh
   kubectl apply -f k8s/deployment.yaml
   kubectl apply -f k8s/service.yaml
   ```

3. **Access the Application**:
   - Use Minikube to access the service:
     ```sh
     minikube service node-app-service
     ```

## GitHub Actions CI/CD Workflow

The `.github/workflows/deploy.yaml` workflow file defines a CI/CD pipeline that:

1. **Builds the Docker Image** when changes are pushed to the `main` branch.
2. **Runs Tests** to ensure code quality.
3. **Pushes the Docker Image** to a Docker registry (e.g., Docker Hub).
4. **Deploys the Image** to the Kubernetes cluster.

## Setting Up GitHub Secrets

To use GitHub Actions for CI/CD, add the following secrets to your GitHub repository:

- **DOCKER_USERNAME**: Your Docker Hub username.
- **DOCKER_PASSWORD**: Your Docker Hub password.
- **KUBECONFIG_JSON**: Your Kubernetes configuration file content for accessing the Minikube cluster.

## Contributing

Feel free to open issues or create pull requests to enhance this project. Contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

