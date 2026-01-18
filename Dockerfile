FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y openjdk-25-jre-headless wget curl

# Set working directory
WORKDIR /app

# Copy Velocity files
COPY velocity /app/velocity
COPY server.toml /app/server.toml

# Make sure configs and scripts are executable
RUN chmod +x /app/server.toml
RUN chmod +x /app/velocity/velocity.toml

# Copy your startup script
COPY main.sh /app/main.sh
RUN chmod +x /app/main.sh

# Expose the Velocity port
EXPOSE 25565

# Run the startup script
CMD ["./main.sh"]
