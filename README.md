# 🚀 Hello World FastAPI + uv + Nixpacks (Coolify)

Este es un proyecto mínimo con **FastAPI**, gestionado con **uv**, y configurado para desplegar en **Coolify** usando **Nixpacks**.  
La aplicación corre en el **puerto 5001** tanto en local como en producción.

---

## 📂 Archivos principales

- `main.py` → código de la aplicación FastAPI.
- `nixpacks.toml` → indica a Coolify/Nixpacks cómo ejecutar la app.
- `pyproject.toml` → dependencias del proyecto.
- `.gitignore` → exclusiones para Git.

---

## ▶️ Ejecutar en local

1. Instala dependencias con [uv](https://github.com/astral-sh/uv):
   ```bash
   uv sync
