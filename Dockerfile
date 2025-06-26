FROM alpine:latest

# Install basic utilities
RUN apk add --no-cache \
    curl \
    wget \
    bash

# Create a simple test file
RUN echo "Hello from GitLab Runner + Podman!" > /hello.txt

# Set working directory
WORKDIR /app

# Copy a simple script
COPY <<EOF /app/test.sh
#!/bin/bash
echo "Container is working!"
echo "Current date: $(date)"
cat /hello.txt
EOF

# Make script executable
RUN chmod +x /app/test.sh

# Set default command
CMD ["/app/test.sh"]