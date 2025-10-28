# 🚀 Base Template para Proyectos Next.js con Docker

Esta es una plantilla base optimizada para crear proyectos Next.js con Docker. **No requiere Node.js instalado en el sistema host** - todo funciona dentro de contenedores Docker.

## 📋 Características

- ✅ **Next.js 14** con TypeScript
- ✅ **Docker** optimizado para desarrollo y producción
- ✅ **Sin dependencias del host** - Solo requiere Docker
- ✅ **Multi-stage builds** para imágenes más pequeñas
- ✅ **Hot reload** en desarrollo
- ✅ **Standalone output** para producción
- ✅ **Soporte para múltiples package managers** (npm, yarn, pnpm)
- ✅ **Configuración de seguridad** optimizada
- ✅ **Variables de entorno** preconfiguradas
- ✅ **Scripts de conveniencia** para comandos npm

## 🛠️ Archivos Incluidos

```
├── Dockerfile              # Imagen de producción optimizada
├── Dockerfile.dev          # Imagen de desarrollo con hot reload
├── docker-compose.yml      # Orquestación de servicios
├── docker-run.sh           # Script de conveniencia para comandos Docker
├── init-project.sh         # Script para crear nuevos proyectos
├── package.json            # Dependencias y scripts
├── next.config.js          # Configuración de Next.js
├── .dockerignore           # Archivos a ignorar en Docker
├── .gitignore              # Archivos a ignorar en Git
├── env.example             # Plantilla de variables de entorno
└── README.md               # Este archivo
```

## 🚀 Uso Rápido

### Opción 1: Usar el script de inicialización (Recomendado)

```bash
# Hacer el script ejecutable
chmod +x init-project.sh

# Crear un nuevo proyecto
./init-project.sh mi-nuevo-proyecto

# El script automáticamente:
# - Crea el directorio del proyecto
# - Copia todos los archivos
# - Actualiza nombres y configuraciones
# - Construye las imágenes Docker
# - Instala las dependencias
```

### Opción 2: Configuración manual

#### 1. Copiar la plantilla

```bash
# Copia todos los archivos a tu nuevo proyecto
cp -r /ruta/a/base_nextjs/* /ruta/a/tu-nuevo-proyecto/
cd /ruta/a/tu-nuevo-proyecto
```

#### 2. Configurar variables de entorno

```bash
# Copia el archivo de ejemplo y configura tus variables
cp env.example .env.local
# Edita .env.local con tus configuraciones
```

#### 3. Construir e instalar dependencias

```bash
# Construir imágenes Docker
docker-compose build

# Instalar dependencias usando Docker
docker-compose --profile tools run --rm npm npm install
```

#### 4. Ejecutar en desarrollo

```bash
# Con Docker (recomendado)
docker-compose --profile dev up -d

# O usando el script de conveniencia
./docker-run.sh up-dev
```

#### 5. Ejecutar en producción

```bash
# Con Docker
docker-compose up -d

# O usando el script de conveniencia
./docker-run.sh up
```

## 📜 Scripts Disponibles

### Script de Conveniencia (Recomendado)
Usa `./docker-run.sh` para ejecutar comandos sin instalar Node.js:

```bash
# Comandos npm
./docker-run.sh install          # Instalar dependencias
./docker-run.sh add [paquete]    # Agregar dependencia
./docker-run.sh remove [paquete] # Remover dependencia
./docker-run.sh run build        # Construir aplicación
./docker-run.sh run lint         # Ejecutar linter
./docker-run.sh run test         # Ejecutar tests

# Comandos Docker Compose
./docker-run.sh up               # Levantar servicios de producción
./docker-run.sh up-dev           # Levantar servicios de desarrollo
./docker-run.sh down             # Parar servicios
./docker-run.sh logs             # Ver logs
./docker-run.sh build            # Construir imágenes
./docker-run.sh clean            # Limpiar contenedores
```

### Scripts de Docker Compose
- `docker-compose up -d` - Ejecutar en producción
- `docker-compose --profile dev up -d` - Ejecutar en desarrollo
- `docker-compose down` - Detener contenedores
- `docker-compose logs -f` - Ver logs
- `docker-compose build` - Construir imágenes

### Scripts de npm (dentro del contenedor)
- `docker-compose --profile tools run --rm npm npm install` - Instalar dependencias
- `docker-compose --profile tools run --rm npm npm run build` - Construir aplicación
- `docker-compose --profile tools run --rm npm npm run lint` - Ejecutar linter

## 🐳 Configuración Docker

### Desarrollo
- **Puerto**: 3750
- **Hot reload**: Habilitado
- **Volúmenes**: Montados para desarrollo en vivo

### Producción
- **Puerto**: 3000
- **Optimizado**: Imagen multi-stage
- **Seguridad**: Usuario no-root
- **Tamaño**: Mínimo posible

## 🔧 Personalización

### Cambiar nombre del proyecto

1. Edita `package.json`:
```json
{
  "name": "tu-nuevo-proyecto",
  "description": "Descripción de tu proyecto"
}
```

2. Edita `docker-compose.yml`:
```yaml
container_name: tu-nuevo-proyecto
```

### Agregar dependencias

```bash
# Usando el script de conveniencia (recomendado)
./docker-run.sh add nueva-dependencia

# O usando Docker Compose directamente
docker-compose --profile tools run --rm npm npm install nueva-dependencia
```

### Configurar base de datos

1. Descomenta las variables en `env.example`
2. Configura tu `.env.local`
3. Agrega el servicio a `docker-compose.yml` si es necesario

## 🌐 Puertos

- **Desarrollo**: http://localhost:3750
- **Producción**: http://localhost:3000

## 📝 Variables de Entorno

Copia `env.example` a `.env.local` y configura:

- `NEXT_PUBLIC_APP_NAME` - Nombre de tu aplicación
- `NEXT_PUBLIC_APP_URL` - URL base de tu aplicación
- Variables de base de datos (si las necesitas)
- Variables de autenticación (si las necesitas)
- Variables de servicios externos (si las necesitas)

## 🔍 Troubleshooting

### Error de permisos en Docker
```bash
sudo chown -R $USER:$USER .
```

### Limpiar caché de Docker
```bash
./docker-run.sh clean
# o
docker-compose down -v && docker system prune -f
```

### Reconstruir imagen
```bash
docker-compose build --no-cache
```

### Ver logs de errores
```bash
./docker-run.sh logs
# o
docker-compose logs -f
```

### Verificar que Docker esté funcionando
```bash
docker --version
docker-compose --version
```

### Problemas con volúmenes
```bash
# Limpiar volúmenes específicos
docker-compose down -v
docker volume prune -f
```

## 📚 Recursos Adicionales

- [Documentación de Next.js](https://nextjs.org/docs)
- [Documentación de Docker](https://docs.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## 🤝 Contribuir

Si encuentras algún problema o tienes sugerencias, por favor:

1. Abre un issue
2. Crea un pull request
3. Comparte tu feedback

---

**¡Happy coding! 🎉**
