FROM n8nio/n8n:latest

USER root

# Install canvas only (no OS deps needed)
RUN npm install -g canvas@2.11.2

USER node
WORKDIR /home/node
