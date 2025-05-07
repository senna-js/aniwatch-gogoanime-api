# Using Node.js 20 LTS with Alpine for smaller size and better security
FROM node:20-alpine

WORKDIR /ani

# Copy package files first for better layer caching
COPY package*.json ./
COPY tsconfig.json ./

# Install dependencies
RUN npm install --production

# Copy source files
COPY src ./src/

# Build the application
RUN npm run build

# Runtime configuration
EXPOSE 3001
CMD ["npm", "run", "start"]