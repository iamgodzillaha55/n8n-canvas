############################
# 1) Build canvas
############################
FROM node:20-bullseye AS canvas-builder

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

############################
# 2) n8n runtime
############################
FROM n8nio/n8n:1.81.0

USER root

# copy only the canvas node module
COPY --from=canvas-builder /usr/local/lib/node_modules/canvas /usr/local/lib/node_modules/canvas

# make it visible to node
RUN npm link /usr/local/lib/node_modules/canvas

USER node
WORKDIR /home/node
