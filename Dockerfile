FROM n8nio/n8n:1.81.0

USER root

# ติดตั้ง dependencies
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

# ติดตั้ง Canvas ใน n8n
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install canvas@2.11.2

# Label
LABEL org.opencontainers.image.source="https://github.com/iamgodzillaha55/n8n-canvas"
LABEL org.opencontainers.image.description="n8n with Canvas support"

USER node
