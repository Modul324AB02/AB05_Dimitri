# Verwende das offizielle Node.js-Image als Basisimage
FROM node:latest

# Setze das Arbeitsverzeichnis innerhalb des Containers
WORKDIR /m324-simple-typescript

# Kopiere die package.json und package-lock.json Dateien in den Container
COPY package.json .

# Installiere die Abhängigkeiten mit Yarn
RUN yarn install

# Kopiere den Quellcode in den Container
COPY . .

# Führe das Build-Skript aus
RUN yarn lint && yarn test && yarn build

# Starte den Server beim Start des Containers
CMD ["yarn", "start"]
