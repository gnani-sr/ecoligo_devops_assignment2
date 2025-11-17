# fastapi-example 

A simple example of using Fast API in Python.

## What changed

### Dockerfile updates
- Now uses Python 3.13 instead of 3.8
- Uses uv package manager instead of pip
- Added proper startup command for FastAPI

### CI/CD improvements
- CI pipeline now uses uv for dependencies
- Fixed AWS region issues in CD pipeline
- Added CronJob deployment step
- Added Teams notifications

## Running locally

### Install dependencies

```
pip install uv
uv pip install -r requirements.txt
```

### Run server

```
uvicorn app.main:app --reload
```

### Run tests

```
make unittest
```

## Docker

```
docker build -t ecoligo-app .
docker run -p 8000:8000 ecoligo-app
```

## API docs

```
http://127.0.0.1:8000/docs
```

## Infrastructure

Terraform and Helm charts are in separate repo:
https://github.com/gnani-sr/ecoligo_devops_terraform
