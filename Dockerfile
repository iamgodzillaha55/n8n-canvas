FROM n8nio/n8n:latest-debian

USER root

# ปิด interactive apt
ENV DEBIAN_FRONTEND=noninteractive

# Fix Debian mirror (สำคัญมากสำหรับ QEMU / ARM)
RUN sed -i 's|http://deb.debian.org|http://ftp.debian.org|g' /etc/apt/sources.list \
 && sed -i 's|http://security.debian.org|http://ftp.debian.org|g' /etc/apt/sources.list

# Install OS deps สำหรับ canvas
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    python3 \
    pkg-config \
    build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install canvas
RUN npm install -g canvas@2.11.2

# กลับเป็น user n8n
USER node
WORKDIR /home/node
