# Dockerfile
FROM jenkins/inbound-agent:latest

# Switch to root to install curl and set permissions
USER root
RUN apt-get update && apt-get install -y curl

# Copy the entrypoint script and set the necessary permissions
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch back to the jenkins user
USER jenkins

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
