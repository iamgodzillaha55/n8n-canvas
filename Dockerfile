# ✅ Base ที่ชัวร์ 100%
FROM node:18-bullseye

ENV NODE_ENV=production

# -------------------------
# 1) ติดตั้ง OS deps สำหรับ canvas
# -------------------------
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    python3 \
    pkg-config \
    tini \
    && rm -rf /var/lib/apt/lists/*

# -------------------------
# 2) ติดตั้ง n8n (ล็อกเวอร์ชัน)
# -------------------------
RUN npm install -g n8n@1.80.0

# -------------------------
# 3) ติดตั้ง canvas (เสถียรบน ARM)
# -------------------------
RUN npm install -g canvas@2.11.2

# -------------------------
# 4) ใช้ user node ที่มีอยู่แล้ว
# -------------------------
USER node
WORKDIR /home/node

EXPOSE 5678

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["n8n"]
