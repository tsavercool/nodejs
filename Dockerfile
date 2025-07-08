FROM alpine:3.17

# Install basic utilities and Node.js
RUN apk add --no-cache \
    curl \
    wget \
    bash \
    nodejs \
    npm

# Intentionally install a specific version of CUPS that has known vulnerabilities
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.17/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.17/community" >> /etc/apk/repositories && \
    apk update && \
    apk add cups=2.4.2-r3

# Set working directory
WORKDIR /app

# Copy application files
COPY ./src /app

# Install dependencies
RUN npm install

# Set default command to run app.js
CMD ["node", "app.js"]
