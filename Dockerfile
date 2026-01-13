# ============================================
# Base: Official n8n (multi-arch, auto update)
# ============================================
FROM n8nio/n8n:latest

# ต้องเป็น root เพื่อ install libs
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
# Install canvas (binary compatible)
# ============================================
RUN npm install -g canvas@2.11.2

# ============================================
# กลับมาใช้ user node ของ n8n
# ============================================
USER node
WORKDIR /home/node

# n8n image มี ENTRYPOINT + CMD อยู่แล้ว
# ❌ ห้าม override
