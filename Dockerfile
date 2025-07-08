FROM alpine:latest

# Install basic utilities and Node.js
RUN apk add --no-cache \
    curl \
    wget \
    bash \
    nodejs \
    npm

# Set working directory
WORKDIR /app

# Copy application files
COPY ./src /app

# Set default command to run app.js
CMD ["node", "app.js"]
