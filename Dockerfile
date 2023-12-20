# Verwende das offizielle Node.js-Image als Basisimage
FROM node:latest

# Setze das Arbeitsverzeichnis innerhalb des Containers
WORKDIR /m324-simple-typescript

# Kopiere die package.json und package-lock.json Dateien in den Container
COPY package.json .
COPY . .
# Installiere die Abhängigkeiten mit Yarn
RUN yarn install

RUN yarn lint

RUN yarn test

RUN yarn build
# Kopiere den Quellcode in den Container


# Führe das Build-Skript aus
RUN yarn lint && yarn test && yarn build

# Starte den Server beim Start des Containers
CMD ["yarn", "start"]
