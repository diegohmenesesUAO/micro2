# Imagen base con arquitectura amd64 forzada
FROM --platform=linux/amd64 python:3.9-slim

# Evito problemas con compilación
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Instalo dependencias del sistema
RUN apt-get update && apt-get install -y gcc

# Crea y usa un directorio de trabajo
WORKDIR /app

# Copio el código
COPY . /app

# Instalo dependencias (puedes usar requirements.txt si tienes)
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Comando de ejecución
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]

