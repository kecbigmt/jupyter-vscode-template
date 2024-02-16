FROM python:3.12.2

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y gcc python3-dev

RUN pip install --upgrade pip && \
    pip install poetry

WORKDIR /app

COPY jupyter/poetry.lock jupyter/pyproject.toml ./

RUN poetry config virtualenvs.create false \
  && poetry install
  