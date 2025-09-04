# Usa la imagen oficial de n8n de la versión que quieres
FROM n8nio/n8n:1.109.2

USER root

# Instala dependencias necesarias y Chromium
RUN apt-get update && \
    apt-get install -y wget gnupg ca-certificates fonts-liberation locales \
      libasound2 libatk1.0-0 libatk-bridge2.0-0 libc6 libcairo2 libdbus-1-3 \
      libexpat1 libfontconfig1 libgbm1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 \
      libpango-1.0-0 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 \
      libxdamage1 libxext6 libxfixes3 libxrandr2 libxrender1 libxss1 libxtst6 \
    && apt-get install -y chromium \
    && rm -rf /var/lib/apt/lists/*

# Indica ruta ejecutable por defecto para puppeteer
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Instala librerías Node que usarás desde los nodos Code/Function
# (puedes añadir pdf-lib u otras aquí)
RUN npm install -g puppeteer pdf-lib

USER node
