FROM alpine:latest

# Create reference to the GitLab repository URL
ARG GITLAB_REPO_URL
ARG LBL_IMAGE_TIER
LABEL org.opencontainers.image.source=$GITLAB_REPO_URL
LABEL org.devexp.image.tier=$LBL_IMAGE_TIER

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
