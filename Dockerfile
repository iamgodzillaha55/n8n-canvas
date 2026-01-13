FROM n8nio/n8n:latest-debian

USER root

# Fix Debian mirror + TLS for QEMU
RUN echo "deb http://deb.debian.org/debian bookworm main contrib non-free" > /etc/apt/sources.list \
 && echo "deb http://security.debian.org/debian-security bookworm-security main" >> /etc/apt/sources.list \
 && apt-get -o Acquire::Retries=5 update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    python3 \
    pkg-config \
 && rm -rf /var/lib/apt/lists/*
