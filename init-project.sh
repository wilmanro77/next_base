# Script para inicializar un nuevo proyecto Next.js con Docker

#!/bin/bash

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Inicializando nuevo proyecto Next.js con Docker (sin dependencias del host)...${NC}"

# Verificar que se proporcione el nombre del proyecto
if [ -z "$1" ]; then
    echo -e "${RED}❌ Error: Debes proporcionar el nombre del proyecto${NC}"
    echo -e "${YELLOW}Uso: ./init-project.sh mi-nuevo-proyecto${NC}"
    exit 1
fi

PROJECT_NAME=$1
PROJECT_DIR="./$PROJECT_NAME"

# Verificar que el directorio no exista
if [ -d "$PROJECT_DIR" ]; then
    echo -e "${RED}❌ Error: El directorio '$PROJECT_DIR' ya existe${NC}"
    exit 1
fi

# Verificar que Docker esté instalado
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Error: Docker no está instalado. Por favor instala Docker primero.${NC}"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}❌ Error: Docker Compose no está instalado. Por favor instala Docker Compose primero.${NC}"
    exit 1
fi

echo -e "${GREEN}📁 Creando directorio del proyecto: $PROJECT_DIR${NC}"
mkdir -p "$PROJECT_DIR"

echo -e "${GREEN}📋 Copiando archivos de la plantilla...${NC}"
cp -r . "$PROJECT_DIR"/

# Remover archivos que no deben copiarse
cd "$PROJECT_DIR"
rm -rf .git
rm -rf node_modules
rm -rf .next
rm -rf out
rm -rf build
rm -f package-lock.json
rm -f yarn.lock
rm -f pnpm-lock.yaml

echo -e "${GREEN}📝 Actualizando package.json...${NC}"
# Actualizar el nombre del proyecto en package.json
sed -i.bak "s/nextjs-docker-base/$PROJECT_NAME/g" package.json
rm package.json.bak

echo -e "${GREEN}📝 Actualizando docker-compose.yml...${NC}"
# Actualizar el nombre del contenedor en docker-compose.yml
sed -i.bak "s/company-app/$PROJECT_NAME-app/g" docker-compose.yml
sed -i.bak "s/company-app-dev/$PROJECT_NAME-app-dev/g" docker-compose.yml
sed -i.bak "s/company-npm/$PROJECT_NAME-npm/g" docker-compose.yml
rm docker-compose.yml.bak

echo -e "${GREEN}📝 Actualizando README.md...${NC}"
# Actualizar el README con el nombre del proyecto
sed -i.bak "s/Mi Aplicación Next.js/$PROJECT_NAME/g" README.md
rm README.md.bak

echo -e "${GREEN}📝 Creando archivo .env.local...${NC}"
cp env.example .env.local

echo -e "${GREEN}🐳 Construyendo contenedores Docker...${NC}"
docker-compose build

echo -e "${GREEN}📦 Instalando dependencias usando Docker...${NC}"
docker-compose --profile tools run --rm npm npm install

echo -e "${GREEN}✅ Proyecto '$PROJECT_NAME' creado exitosamente!${NC}"
echo -e "${BLUE}📋 Próximos pasos:${NC}"
echo -e "${YELLOW}1. cd $PROJECT_DIR${NC}"
echo -e "${YELLOW}2. Edita .env.local con tus configuraciones${NC}"
echo -e "${YELLOW}3. docker-compose --profile dev up -d (para desarrollo)${NC}"
echo -e "${YELLOW}4. docker-compose up -d (para producción)${NC}"
echo -e "${BLUE}🌐 Tu aplicación estará disponible en:${NC}"
echo -e "${YELLOW}   Desarrollo: http://localhost:3750${NC}"
echo -e "${YELLOW}   Producción: http://localhost:3000${NC}"
echo -e "${BLUE}🔧 Comandos útiles:${NC}"
echo -e "${YELLOW}   Instalar dependencias: docker-compose --profile tools run --rm npm npm install${NC}"
echo -e "${YELLOW}   Ejecutar comandos npm: docker-compose --profile tools run --rm npm npm [comando]${NC}"
echo -e "${YELLOW}   Ver logs: docker-compose logs -f${NC}"
echo -e "${YELLOW}   Parar servicios: docker-compose down${NC}"
