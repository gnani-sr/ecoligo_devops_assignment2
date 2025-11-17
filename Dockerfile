# pull official base image
FROM python:3.13-alpine

# set work directory
WORKDIR /src

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install uv
RUN pip install uv==0.8.22

# copy requirements file
COPY ./requirements.txt /src/requirements.txt

# install dependencies
RUN set -eux \
    && apk add --no-cache --virtual .build-deps build-base \
    libressl-dev libffi-dev gcc musl-dev python3-dev \
    && uv pip install --system -r /src/requirements.txt \
    && apk del .build-deps

# copy project
COPY . /src/

# expose port
EXPOSE 8000

# start FastAPI application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]