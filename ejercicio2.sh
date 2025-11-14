#!/bin/bash

# ===========================
# Ejercicio 2 - Crear repositorio local y vincularlo a un remoto
# ===========================

# Validar parámetros
if [ $# -ne 3 ]; then
    echo "Uso correcto: $0 <carpeta_local> <url_repositorio_remoto> <rama>"
    exit 1
    fi

CARPETA=$1
URL=$2
RAMA=$3

# 1) Crear la carpeta si no existe
if [ ! -d "$CARPETA" ]; then
    echo "Creando carpeta: $CARPETA"
    mkdir "$CARPETA"
fi

cd "$CARPETA"

# 2) Inicializar repositorio local
echo "Inicializando repositorio Git local..."
git init

# 3) Crear archivos iniciales
echo "Creando README.md y .gitignore..."
echo "# Repositorio creado automáticamente por script" > README.md
echo ".vscode/" > .gitignore
echo "*.log" >> .gitignore

# 4) Agregar archivos al staging
echo "Agregando archivos..."
git add .

# 5) Realizar commit inicial
echo "Realizando commit inicial..."
git commit -m "Commit inicial automático"

# 6) Configurar repositorio remoto
echo "Agregando repositorio remoto..."
git remote add origin "$URL"

# 7) Hacer push
echo "Subiendo cambios a la rama $RAMA..."
git branch -M "$RAMA"
git push -u origin "$RAMA"

echo "¡Repositorio configurado y enviado exitosamente!"
