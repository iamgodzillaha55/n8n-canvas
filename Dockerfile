FROM n8nio/n8n:node20
USER root
RUN npm install -g canvas@2.11.2
USER node
WORKDIR /home/node
