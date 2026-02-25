#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Sin color

for dir in */ ; do
    if [ -d "$dir/.git" ]; then
        echo -e "${YELLOW}Actualizando repositorios en : ${GREEN}$dir${NC}"
        cd "$dir" || continue
        git pull
        cd ..
    else
        echo -e "${RED}Saltando $dir (no es un repositorio Git)${NC}"
    fi
done