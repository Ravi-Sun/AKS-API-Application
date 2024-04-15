User Story:
Need to create API as forntend and database as backend in AKS. 
The API should be scalable, reliable, and secure. 
Also the data to be stored persistently in a database, ensuring data integrity and confidentiality.
Infrastrure need to be crearted using a IAC tool

Tasks in User Story:

Infrastructure Setup with Terraform:
Define Terraform modules to provision Resource group, AKS cluster, Azure Container Registory, networking components and persistent storage.
Structure Terraform code for multiple environments (e.g., dev, staging, production).
Implement best practices for Terraform code organization, variable management and state management.

Kubernetes Resources with Helm Charts:
Create Helm charts for deploying API replicas and database instances.
Define Kubernetes resources such as Deployments, Services, ConfigMaps, Secrets, and PersistentVolumeClaims.
Parameterize Helm charts for configuration flexibility across environments.

Dockerfiles for Container Images:
Write Dockerfiles for building container images of the API and database.
Include necessary dependencies and environment configurations in Dockerfiles.
Optimize Dockerfiles for efficient image building and runtime performance.

Networking and Access Control:
Configure Kubernetes network policies to control communication between API replicas and the database.
Expose the API externally while restricting access to the database.
Implement secrets management for sensitive information such as database credentials.

CI/CD Pipeline Setup:
Integrate with a CI/CD platform Azure DevOps for automated deployment.
Define pipeline stages for building Docker images, deploying Helm charts, and promoting releases.
Configure pipeline triggers and notifications for efficient and reliable deployment automation.

Design Choices:

Azure Kubernetes Service (AKS): Chosen for its managed Kubernetes offering, simplifying cluster management.
Terraform: Used for infrastructure as code to provision and manage resources in a consistent and repeatable manner.
Helm Charts: Employed for defining and managing Kubernetes resources to streamline deployment and updates.
Docker: Utilized for containerizing the API and database, ensuring consistent runtime environments.
CI/CD Pipeline: Implemented for automating the deployment process, improving efficiency and reliability.

Technical Architecture:

Azure Kubernetes Service (AKS) Cluster: Orchestrates the deployment of API and database containers.
Terraform: Defines infrastructure resources such as Resource group, AKS cluster, Azure Container Registory, networking components and persistent storage.
Helm Charts: Describe Kubernetes resources for deploying API replicas, database instances, and related configurations.
Dockerfiles: Specify instructions for building Docker images of the API and database.
Networking: Configured to allow external access to the API while restricting database access.
CI/CD Pipeline: Automates the deployment process, integrating with version control and testing frameworks.