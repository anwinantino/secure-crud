# Use a slim Node base image
FROM node:20-slim

# Create app directory
WORKDIR /app

# Create a non-root user
RUN useradd -m appuser

# Copy package files first (for layer caching)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy app source
COPY src ./src

# Change ownership of app files
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose internal app port
EXPOSE 5000

# Start the app
CMD ["node", "src/app.js"]