#!/bin/bash

# Script de ejemplo para demostrar el uso de la base Next.js con Docker
# Este script muestra cómo usar la plantilla sin instalar Node.js en el host

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Ejemplo de uso de la base Next.js con Docker${NC}"
echo -e "${YELLOW}Este script demuestra cómo usar la plantilla sin Node.js en el host${NC}"
echo ""

# Verificar que Docker esté instalado
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Error: Docker no está instalado.${NC}"
    echo -e "${YELLOW}Por favor instala Docker primero: https://docs.docker.com/get-docker/${NC}"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}❌ Error: Docker Compose no está instalado.${NC}"
    echo -e "${YELLOW}Por favor instala Docker Compose primero: https://docs.docker.com/compose/install/${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Docker y Docker Compose están instalados${NC}"
echo ""

# Mostrar comandos disponibles
echo -e "${BLUE}📋 Comandos disponibles:${NC}"
echo ""
echo -e "${YELLOW}1. Crear un nuevo proyecto:${NC}"
echo -e "   ./init-project.sh mi-nuevo-proyecto"
echo ""
echo -e "${YELLOW}2. Construir las imágenes Docker:${NC}"
echo -e "   docker-compose build"
echo ""
echo -e "${YELLOW}3. Instalar dependencias:${NC}"
echo -e "   ./docker-run.sh install"
echo ""
echo -e "${YELLOW}4. Ejecutar en modo desarrollo:${NC}"
echo -e "   ./docker-run.sh up-dev"
echo -e "   # La aplicación estará disponible en http://localhost:3750"
echo ""
echo -e "${YELLOW}5. Ejecutar en modo producción:${NC}"
echo -e "   ./docker-run.sh up"
echo -e "   # La aplicación estará disponible en http://localhost:3000"
echo ""
echo -e "${YELLOW}6. Ver logs:${NC}"
echo -e "   ./docker-run.sh logs"
echo ""
echo -e "${YELLOW}7. Parar servicios:${NC}"
echo -e "   ./docker-run.sh down"
echo ""
echo -e "${YELLOW}8. Agregar una nueva dependencia:${NC}"
echo -e "   ./docker-run.sh add react-icons"
echo ""
echo -e "${YELLOW}9. Ejecutar linter:${NC}"
echo -e "   ./docker-run.sh run lint"
echo ""
echo -e "${YELLOW}10. Limpiar contenedores:${NC}"
echo -e "    ./docker-run.sh clean"
echo ""

# Preguntar si quiere ejecutar un ejemplo
echo -e "${BLUE}¿Quieres ejecutar un ejemplo? (y/n)${NC}"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    echo -e "${GREEN}🔨 Construyendo imágenes Docker...${NC}"
    docker-compose build
    
    echo -e "${GREEN}📦 Instalando dependencias...${NC}"
    docker-compose --profile tools run --rm npm npm install
    
    echo -e "${GREEN}🚀 Ejecutando en modo desarrollo...${NC}"
    echo -e "${YELLOW}La aplicación estará disponible en http://localhost:3750${NC}"
    echo -e "${YELLOW}Presiona Ctrl+C para parar${NC}"
    
    docker-compose --profile dev up
else
    echo -e "${BLUE}👋 ¡Perfecto! Ahora puedes usar los comandos mostrados arriba.${NC}"
fi
