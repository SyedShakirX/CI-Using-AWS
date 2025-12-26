#!/bin/bash
set -e

#The Image will be pulled from my ECR
docker pull public.ecr.aws/n2p7k0f2/aws-ci-cd-python-flask:latest

#I have enabled port 8000 on Security Group attached to my EC2
docker run -p 5000:8000 public.ecr.aws/n2p7k0f2/aws-ci-cd-python-flask:latest
