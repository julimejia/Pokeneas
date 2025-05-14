FROM node:20-alpine

# Establece el directorio de trabajo primero
WORKDIR /app

# 1. Copia solo los archivos necesarios para npm install
COPY package.json package-lock.json ./

# 2. Limpia caché npm y reinstala
RUN npm cache clean --force && \
    rm -rf node_modules && \
    npm install --production

# 3. Copia el resto de archivos
COPY . .

# 4. Asegúrate de usar la ruta correcta a tu index.js
CMD ["node", "src/index.js"]