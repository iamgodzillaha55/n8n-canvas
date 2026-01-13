# ============================================
# Base: Debian version of n8n (has apt-get)
# ============================================
FROM n8nio/n8n:latest-debian

USER root

# ============================================
# OS deps สำหรับ canvas (ARM + x86)
# ============================================
RUN apt-get update && apt-get install -y \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    python3 \
    pkg-config \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# ============================================
# Install canvas
# ============================================
RUN npm install -g canvas@2.11.2

# ============================================
# กลับไปใช้ user n8n
# ============================================
USER node
WORKDIR /home/node
