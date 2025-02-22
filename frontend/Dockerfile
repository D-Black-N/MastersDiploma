# Use Node.js official image
FROM node:18-alpine

# Set working directory in the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy all project files
COPY . .

# Expose a port for Vue (Vite uses 5173, Vue CLI uses 8080)
EXPOSE 5173 8080

# Default command to keep the container running
CMD ["npm", "run", "serve"]
