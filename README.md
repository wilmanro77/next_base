# 🚀 Base Template para Proyectos Next.js con Docker

Esta es una plantilla base optimizada para crear proyectos Next.js con Docker. Incluye configuración completa para desarrollo y producción.

## 📋 Características

- ✅ **Next.js 14** con TypeScript
- ✅ **Docker** optimizado para desarrollo y producción
- ✅ **Multi-stage builds** para imágenes más pequeñas
- ✅ **Hot reload** en desarrollo
- ✅ **Standalone output** para producción
- ✅ **Soporte para múltiples package managers** (npm, yarn, pnpm)
- ✅ **Configuración de seguridad** optimizada
- ✅ **Variables de entorno** preconfiguradas

## 🛠️ Archivos Incluidos

```
├── Dockerfile              # Imagen de producción optimizada
├── Dockerfile.dev          # Imagen de desarrollo con hot reload
├── docker-compose.yml      # Orquestación de servicios
├── package.json            # Dependencias y scripts
├── next.config.js          # Configuración de Next.js
├── .dockerignore           # Archivos a ignorar en Docker
├── .gitignore              # Archivos a ignorar en Git
├── env.example             # Plantilla de variables de entorno
└── README.md               # Este archivo
```

## 🚀 Uso Rápido

### 1. Copiar la plantilla

```bash
# Copia todos los archivos a tu nuevo proyecto
cp -r /ruta/a/base_nextjs/* /ruta/a/tu-nuevo-proyecto/
cd /ruta/a/tu-nuevo-proyecto
```

### 2. Configurar variables de entorno

```bash
# Copia el archivo de ejemplo y configura tus variables
cp env.example .env.local
# Edita .env.local con tus configuraciones
```

### 3. Instalar dependencias

```bash
npm install
# o
yarn install
# o
pnpm install
```

### 4. Ejecutar en desarrollo

```bash
# Opción 1: Con Docker (recomendado)
npm run docker:dev

# Opción 2: Localmente
npm run dev
```

### 5. Construir para producción

```bash
# Construir imagen de producción
npm run docker:build

# Ejecutar en producción
npm run docker:up
```

## 📜 Scripts Disponibles

### Scripts de Desarrollo
- `npm run dev` - Ejecutar servidor de desarrollo localmente
- `npm run docker:dev` - Ejecutar con Docker en modo desarrollo
- `npm run docker:logs` - Ver logs de los contenedores

### Scripts de Producción
- `npm run build` - Construir aplicación para producción
- `npm run start` - Ejecutar aplicación en producción
- `npm run docker:build` - Construir imagen Docker de producción
- `npm run docker:up` - Ejecutar aplicación en producción con Docker

### Scripts de Mantenimiento
- `npm run docker:down` - Detener contenedores
- `npm run docker:clean` - Limpiar contenedores y volúmenes
- `npm run lint` - Ejecutar linter

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
npm install nueva-dependencia
# o
yarn add nueva-dependencia
# o
pnpm add nueva-dependencia
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
npm run docker:clean
```

### Reconstruir imagen
```bash
docker-compose build --no-cache
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
