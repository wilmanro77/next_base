#!/bin/bash

# Script de conveniencia para ejecutar comandos npm dentro del contenedor Docker
# Uso: ./docker-run.sh [comando npm]

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Verificar que Docker esté instalado
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Error: Docker no está instalado.${NC}"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}❌ Error: Docker Compose no está instalado.${NC}"
    exit 1
fi

# Si no se proporciona ningún comando, mostrar ayuda
if [ -z "$1" ]; then
    echo -e "${BLUE}🔧 Script de conveniencia para comandos Docker${NC}"
    echo -e "${YELLOW}Uso: ./docker-run.sh [comando npm]${NC}"
    echo -e "${BLUE}Ejemplos:${NC}"
    echo -e "${YELLOW}  ./docker-run.sh install${NC}          # Instalar dependencias"
    echo -e "${YELLOW}  ./docker-run.sh run dev${NC}          # Ejecutar en modo desarrollo"
    echo -e "${YELLOW}  ./docker-run.sh run build${NC}        # Construir la aplicación"
    echo -e "${YELLOW}  ./docker-run.sh run lint${NC}         # Ejecutar linter"
    echo -e "${YELLOW}  ./docker-run.sh run test${NC}         # Ejecutar tests"
    echo -e "${YELLOW}  ./docker-run.sh add [paquete]${NC}    # Agregar dependencia"
    echo -e "${YELLOW}  ./docker-run.sh remove [paquete]${NC} # Remover dependencia"
    echo -e "${BLUE}Comandos Docker Compose:${NC}"
    echo -e "${YELLOW}  ./docker-run.sh up${NC}               # Levantar servicios de producción"
    echo -e "${YELLOW}  ./docker-run.sh up-dev${NC}           # Levantar servicios de desarrollo"
    echo -e "${YELLOW}  ./docker-run.sh down${NC}             # Parar servicios"
    echo -e "${YELLOW}  ./docker-run.sh logs${NC}             # Ver logs"
    echo -e "${YELLOW}  ./docker-run.sh build${NC}            # Construir imágenes"
    exit 0
fi

# Comandos especiales de Docker Compose
case "$1" in
    "up")
        echo -e "${GREEN}🚀 Levantando servicios de producción...${NC}"
        docker-compose up -d
        ;;
    "up-dev")
        echo -e "${GREEN}🚀 Levantando servicios de desarrollo...${NC}"
        docker-compose --profile dev up -d
        ;;
    "down")
        echo -e "${GREEN}🛑 Parando servicios...${NC}"
        docker-compose down
        ;;
    "logs")
        echo -e "${GREEN}📋 Mostrando logs...${NC}"
        docker-compose logs -f
        ;;
    "build")
        echo -e "${GREEN}🔨 Construyendo imágenes...${NC}"
        docker-compose build
        ;;
    "clean")
        echo -e "${GREEN}🧹 Limpiando contenedores y volúmenes...${NC}"
        docker-compose down -v
        docker system prune -f
        ;;
    *)
        # Ejecutar comando npm dentro del contenedor
        echo -e "${GREEN}🐳 Ejecutando: npm $@${NC}"
        docker-compose --profile tools run --rm npm npm "$@"
        ;;
esac
