# 🚀 Hello World con FastAPI + uv + Nixpacks (Coolify)

Este repositorio contiene un proyecto mínimo escrito en **Python**
usando el framework **FastAPI**, gestionado con **uv** como manejador de
dependencias, y configurado para desplegarse fácilmente en **Coolify**
mediante **Nixpacks**.

La aplicación corre en el **puerto 5001** tanto en tu máquina local como
en producción en Coolify.\
Incluye ejemplos básicos de endpoints y está pensado como una plantilla
para tus futuros proyectos.

------------------------------------------------------------------------

## 🛠️ Tecnologías utilizadas

### [FastAPI](https://fastapi.tiangolo.com/)

Framework moderno para construir APIs con Python. Ofrece: - Validación
automática de datos con Pydantic. - Generación de documentación
interactiva (Swagger UI y Redoc). - Soporte asíncrono de alto
rendimiento gracias a Uvicorn/Starlette.

### [uv](https://github.com/astral-sh/uv)

Un reemplazo ultrarrápido para `pip` y `virtualenv`. Provee: - Gestión
de dependencias mediante `pyproject.toml`. - Archivos de lock
(`uv.lock`) para instalaciones reproducibles. - Ejecución de comandos
con entornos virtuales integrados.

### [Nixpacks](https://nixpacks.com/)

Herramienta que analiza tu repositorio y genera automáticamente una
imagen de contenedor lista para ejecutar.\
Coolify lo usa como *buildpack* por defecto si detecta un archivo
`nixpacks.toml`.

### [Coolify](https://coolify.io/)

Plataforma de auto-hosting tipo Heroku/Vercel. Permite: - Desplegar apps
directamente desde GitHub/GitLab. - Configuración automática de dominios
y certificados SSL. - Soporte para múltiples bases de datos y servicios.

------------------------------------------------------------------------

## 📂 Estructura del proyecto

    hello-world/
    ├── main.py          # Código principal de la aplicación FastAPI
    ├── nixpacks.toml    # Configuración de Nixpacks (define cómo arrancar la app)
    ├── pyproject.toml   # Archivo de configuración del proyecto Python
    ├── uv.lock          # Lockfile con dependencias exactas (generado por uv)
    └── .gitignore       # Archivos y carpetas a ignorar en Git

------------------------------------------------------------------------

## ▶️ Ejecutar en local

Sigue estos pasos para correr la aplicación en tu máquina:

1.  **Clonar el repositorio**

    ``` bash
    git clone https://github.com/davidrumbaut620/Coolify-Python-test-app-.git
    cd hello-world
    ```

2.  **Instalar dependencias con uv**

    ``` bash
    uv sync
    ```

    Esto instalará automáticamente FastAPI y Uvicorn en un entorno
    virtual controlado por `uv`.

3.  **Ejecutar la aplicación en el puerto 5001**

    ``` bash
    uv run fastapi dev main.py --port 5001
    ```

4.  **Abrir en el navegador**

    -   Endpoint raíz: <http://127.0.0.1:5001>\
    -   Documentación interactiva (Swagger):
        <http://127.0.0.1:5001/docs>\
    -   Documentación alternativa (Redoc): <http://127.0.0.1:5001/redoc>

------------------------------------------------------------------------

## ☁️ Desplegar en Coolify

1.  **Subir el proyecto a GitHub**

    ``` bash
    git init
    git add .
    git commit -m "Initial FastAPI project with uv and nixpacks"
    git branch -M main
    git remote add origin git@github.com:TU_USUARIO/hello-world.git
    git push -u origin main
    ```

2.  **Crear una nueva aplicación en Coolify**

    -   Accede a tu dashboard de Coolify.\
    -   Haz clic en **New Application**.\
    -   Fuente: selecciona tu repositorio en GitHub.

3.  **Coolify detecta Nixpacks automáticamente**

    -   Encontrará el archivo `nixpacks.toml`.\

    -   Usará el comando:

        ``` toml
        [start]
        cmd = "fastapi run main.py --port 5001"
        ```

    -   Esto levantará tu app en el puerto 5001.

4.  **Configurar el puerto en Coolify**

    -   Ve a **Settings → Network/Ports**.\
    -   Cambia el **puerto interno** a `5001`.\
    -   Guarda los cambios.

5.  **Deploy**

    -   Haz clic en **Deploy**.\
    -   Coolify construirá la imagen con Nixpacks, arrancará el
        contenedor y expondrá el servicio.\
    -   Cada vez que hagas `git push`, Coolify redeployará tu aplicación
        automáticamente.

6.  **Opcional: añadir un dominio personalizado**

    -   En la sección **Domains**, añade tu dominio (ejemplo:
        `api.midominio.com`).\
    -   Activa SSL para obtener un certificado de Let's Encrypt
        automáticamente.\
    -   Ahora tu API será accesible de forma segura con HTTPS.

------------------------------------------------------------------------

## 📝 Notas importantes

-   El puerto por defecto de Coolify es `3000`, pero este proyecto está
    configurado en **5001**, así que asegúrate de ajustar el puerto en
    la configuración.\
-   El archivo `.gitignore` evita subir archivos generados como
    `__pycache__`, `.venv`, `*.pyc` y `uv.lock`.\
-   Puedes personalizar el número de workers, middleware o dependencias
    según tus necesidades.\
-   Para entornos productivos más grandes, considera usar **variables de
    entorno** en Coolify para cosas como claves secretas, base de datos,
    etc.

------------------------------------------------------------------------

## 📌 Ejemplo de endpoints

-   **GET /**

    ``` json
    {
      "Hello": "World from port 5001!"
    }
    ```

-   **GET /items/123?q=test**

    ``` json
    {
      "item_id": 123,
      "q": "test"
    }
    ```

------------------------------------------------------------------------

## 🎯 Próximos pasos sugeridos

-   Agregar pruebas unitarias con `pytest`.\
-   Añadir `pre-commit` hooks para linting automático.\
-   Conectar la API a una base de datos (ejemplo: PostgreSQL en
    Coolify).\
-   Añadir autenticación con OAuth2/JWT si el proyecto lo necesita.

------------------------------------------------------------------------

## 📚 Recursos recomendados

-   [Documentación oficial de FastAPI](https://fastapi.tiangolo.com/)\
-   [uv: gestor de dependencias](https://github.com/astral-sh/uv)\
-   [Nixpacks](https://nixpacks.com/docs)\
-   [Coolify](https://coolify.io/docs)
