FROM n8nio/n8n:1.81.0

USER root
RUN npm install -g canvas@2.11.2

USER node
WORKDIR /home/node
