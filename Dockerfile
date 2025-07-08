FROM alpine:3.17

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

# Install dependencies
RUN npm install

# Set default command to run app.js
CMD ["node", "app.js"]
