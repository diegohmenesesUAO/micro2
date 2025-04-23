# Imagen base
FROM --platform=linux/amd64 python:3.9-slim

# Evito problemas con compilación
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Instalo dependencias del sistema necesarias para compilar
RUN apt-get update && apt-get install -y gcc build-essential

# Crea y usa el directorio de trabajo
WORKDIR /app

# Copia el código
COPY . .

# Actualiza pip e instala dependencias desde requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-binary :all: uvicorn fastapi

# Comando de ejecución
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]

