# Use official Node.js LTS image
FROM node:18

# Set working directory inside container
WORKDIR /app

# Copy only package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the full application source code
COPY . .

# Expose the app's port
EXPOSE 3000

# Run the app
CMD ["node", "app.js"]
