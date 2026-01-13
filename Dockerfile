FROM n8nio/n8n:1.81.0

USER root

# ติดตั้ง dependencies สำหรับ Canvas (Alpine)
RUN apk add --no-cache \
    build-base \
    cairo-dev \
    pango-dev \
    jpeg-dev \
    giflib-dev \
    librsvg-dev \
    python3 \
    pkgconfig

# ติดตั้ง Canvas ใน n8n
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install canvas@2.11.2

# Label
LABEL org.opencontainers.image.source="https://github.com/iamgodzillaha55/n8n-canvas"
LABEL org.opencontainers.image.description="n8n with Canvas support"

USER node
