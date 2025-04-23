# Imagen base con arquitectura amd64 forzada
FROM --platform=linux/amd64 python:3.9-slim

# Evito problemas comunes con Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Instalo herramientas básicas (gcc por si alguna lib lo requiere)
RUN apt-get update && apt-get install -y gcc

# Directorio de trabajo
WORKDIR /app

# Copio el código
COPY . .

# Instalo dependencias
RUN pip install --upgrade pip
RUN pip install uvicorn fastapi

# Comando de ejecución
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]

