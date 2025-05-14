# Etapa de construcción
FROM node:18-alpine as builder

WORKDIR /app
COPY package*.json ./
RUN npm ci

# Copia solo los archivos necesarios
COPY src/ ./src/
COPY *.js ./ 

# Etapa de producción
FROM node:18-alpine

WORKDIR /app

# Copia desde el builder
COPY --from=builder /app .

# Instala solo producción (opcional pero recomendado)
RUN npm prune --production

EXPOSE 3000
CMD ["node", "src/index.js"]  # Asegúrate que apunte a tu archivo principal