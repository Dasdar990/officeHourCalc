# Usa un'immagine Node.js come base
FROM node:20

# Imposta la directory di lavoro
WORKDIR /usr/src/app

# Copia i file di dipendenza e il package.json
COPY package*.json ./

# Installa le dipendenze
RUN npm install

# Copia il resto dell'app
COPY . .

# Espone la porta 3000, che è la porta predefinita di Nuxt.js nel container
EXPOSE 3000

# Avvia l'applicazione Nuxt.js
CMD ["npm", "run", "dev"]
