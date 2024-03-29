FROM node:16

# Install dependencies
RUN apt-get update &&\
apt-get install -yq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 \
libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 \
ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget \
xvfb x11vnc x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps \
libgbm1 ffmpeg

# Cd into /app
WORKDIR /app

# Copy package.json into app folder
COPY package.json /app

# Install dependencies
RUN npm install

COPY . /app

RUN chmod a+x wrap.sh
RUN mkdir -p /var/boozang
RUN chmod a+rw /var/boozang

VOLUME /var/boozang

# Make Chrome downloads dir
RUN mkdir -p /root/Downloads/

# Include versioning file
ADD VERSION .

# Start server on port 3000∂
EXPOSE 3000:3001
ENV PORT=3001

# Creating Display
ENV DISPLAY :99

# Start script on Xvfb
ENTRYPOINT ["./wrap.sh"]


# ENTRYPOINT ["Xvfb :99 -screen 0 1024x768x16 & boozang"]
#ENTRYPOINT ["Xvfb :99 -screen 0 1024x768x16 & npm start"]
