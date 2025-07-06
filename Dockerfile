FROM alpine:latest

# Install required packages
RUN apk add --no-cache \
    unzip \
    ca-certificates \
    wget

# Create app directory
WORKDIR /app

# Download PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.6/pocketbase_0.22.6_linux_amd64.zip \
    && unzip pocketbase_0.22.6_linux_amd64.zip \
    && chmod +x pocketbase \
    && rm pocketbase_0.22.6_linux_amd64.zip

# Create data directory
RUN mkdir -p /app/pb_data

# Expose port (Render will set PORT environment variable)
EXPOSE 8080

# Start PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8080"]
