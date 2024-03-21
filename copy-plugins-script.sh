#!/bin/bash

# Verificar que se proporcionen dos argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <nombre_del_contenedor> <ruta_en_el_host>"
    exit 1
fi

# Nombre del contenedor
CONTAINER_NAME=$1

# Ruta en el host donde se desean copiar los plugins desde el contenedor
HOST_PATH=$2

# Verificar si el contenedor existe
if ! docker inspect "$CONTAINER_NAME" &> /dev/null; then
    echo "Error: El contenedor '$CONTAINER_NAME' no existe."
    exit 1
fi

# Copiar archivos del contenedor al host
docker cp "$CONTAINER_NAME:/var/www/html/plugins/." "$HOST_PATH"
echo "Archivos copiados del contenedor al host en la ruta: $HOST_PATH"