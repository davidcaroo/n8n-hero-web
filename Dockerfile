FROM n8nio/n8n:1.109.2

USER root

# Instala Chromium y librerías necesarias en Alpine
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# Configura Puppeteer para usar el Chromium del sistema
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Instala librerías Node adicionales (puppeteer y pdf-lib)
RUN npm install -g puppeteer pdf-lib

USER node
