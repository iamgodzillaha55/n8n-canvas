FROM n8nio/n8n:latest-debian

USER root

# OS deps สำหรับ canvas
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    python3 \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# pin n8n version
RUN npm install -g n8n@1.81.0

# canvas ที่ compatible กับ Node 20
RUN npm install -g canvas@2.11.2

USER node
WORKDIR /home/node
