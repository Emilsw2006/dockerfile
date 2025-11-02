FROM n8nio/n8n:latest

USER root

# Instalar Chromium y dependencias necesarias
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    yarn

# Instalar Puppeteer
RUN npm install -g puppeteer-core puppeteer

# Variables de entorno para Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

USER node
```

3. **Haz commit y push** al repositorio

---

## **Paso 2: Configurar Railway**

1. **Ve a tu proyecto n8n en Railway**

2. **Settings → Deploy**
   - **Build Method**: Dockerfile
   - **Dockerfile Path**: `Dockerfile`

3. **Variables de entorno** (añade estas en Railway):
```
   NODE_FUNCTION_ALLOW_BUILTIN=*
   NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer,puppeteer-core
   PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
   PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
