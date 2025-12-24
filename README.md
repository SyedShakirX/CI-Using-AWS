CodeBuild-CI-Docker-Flask
This repository contains a CI/CD pipeline using AWS CodeBuild and CodePipeline to build, tag, and push a Flask Docker image to AWS ECR Public repository public.ecr.aws/n2p7k0f2/code-build-ci. Connected to GitHub for automated deployments on code changes.
​

Features
Builds Python 3.11-slim Docker image with Flask dependencies.

Automates ECR Public login, build, tag, and push via CodeBuild buildspec.yml.

Integrates with AWS CodePipeline for GitHub-triggered CI workflow.

Prerequisites
AWS CLI configured with access to ECR Public (us-east-1).

GitHub repo connected to CodePipeline source stage.

Parameter Store value /CodeBuild/Docker/PAT for authentication (unused in current spec).

Repository Structure
text
.
├── requirements.txt     # Flask dependency
├── Dockerfile          # Python 3.11-slim base, installs deps, exposes 5000
├── app.py              # Flask application entrypoint (not provided)
├── buildspec.yml       # CodeBuild phases: install, pre_build (ECR login), build/tag, post_build (push)
└── README.md           # This file
Pipeline Flow
Source: GitHub repo via CodePipeline.

Build: CodeBuild executes buildspec.yml:

Installs Python 3.11 and requirements.

Logs into ECR Public: aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n2p7k0f2 
​.

Builds: docker build -t code-build-ci .

Tags: docker tag code-build-ci:latest public.ecr.aws/n2p7k0f2/code-build-ci:latest

Pushes: docker push public.ecr.aws/n2p7k0f2/code-build-ci:latest

Deploys image to ECR Public for downstream use (e.g., ECS, EKS).

Local Testing
bash
# Build and test locally
docker build -t code-build-ci .
docker run -p 5000:5000 code-build-ci

# Push to ECR (manual)
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/n2p7k0f2
docker push public.ecr.aws/n2p7k0f2/code-build-ci:latest
Contributing
Fork, create feature branch, add changes, PR to main. Ensure buildspec.yml syntax valid and tests pass locally.
​

License
MIT License. See LICENSE for details.
