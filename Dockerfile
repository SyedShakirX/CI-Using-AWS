FROM public.ecr.aws/docker/library/python:3.11-slim    
#Use public.ecr.aws/docker/library/python:3.11-slim in AWS CodeBuild to bypass Docker Hub rate limits via ECR's cached layers, ensuring reliable CI builds unlike python:latest or python:3.11-slim  which hit pull quotas from public Docker Hub

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 5000

ENTRYPOINT ["python"]

CMD ["app.py"]
