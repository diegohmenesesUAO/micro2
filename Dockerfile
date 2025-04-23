# Imagen base con arquitectura amd64 forzada
FROM --platform=linux/amd64 python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y gcc

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip
RUN pip install uvicorn fastapi

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]

