# cicd_with_healthcheck
A Python App with healthcheck endpoint on Docker, ECR, EKS, Terraform and GitHub Actions

# Dockerfile Steps
* Get Python (FROM) source
* Set ENV vars
* Install Git
* Set working WORKDIR directory
* COPY requirements file and install dependencies
* COPY application code including .git dir
* EXPOSE port on which the app will run
* (FROM) Build stage for testing
* RUN unit tests
* (FROM) Build stage for final image
* RUNRun the application








