# Imagen base oficial de Python
FROM python:3.12-slim

# Instalar dependencias del sistema necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl build-essential \
    && rm -rf /var/lib/apt/lists/*

# Instalar uv (gestor de dependencias)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Agregar uv al PATH
ENV PATH="/root/.cargo/bin:$PATH"

# Crear directorio de la app
WORKDIR /app

# Copiar archivos de proyecto
COPY pyproject.toml uv.lock* README.md /app/
COPY main.py /app/

# Instalar dependencias usando uv
RUN uv sync --frozen

# Exponer el puerto 5001
EXPOSE 5001

# Comando para arrancar la app en producción
CMD ["uv", "run", "fastapi", "run", "main.py", "--port", "5001", "--host", "0.0.0.0"]
