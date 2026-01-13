FROM n8nio/n8n:1.81.0-debian

USER root

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

RUN npm install -g canvas@2.11.2

USER node
WORKDIR /home/node
