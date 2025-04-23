# Imagen base
FROM --platform=linux/amd64 python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Instalo dependencias del sistema necesarias para compilar
RUN apt-get update && apt-get install -y gcc libffi-dev build-essential python3-dev

# Directorio de trabajo
WORKDIR /app

# Copio el código
COPY . .

# Instalo dependencias desde requirements.txt (compiladas)
RUN pip install --upgrade pip
RUN pip install --no-binary :all: uvicorn fastapi

# Comando de ejecución
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]

