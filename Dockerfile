FROM jlesage/baseimage-gui:ubuntu-18.04

EXPOSE 9222

RUN apt-get update && apt-get install -y wget \
libnss3 libgtk-3-0 libxss1 libasound2 gnupg2

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        chromium-browser \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN echo "CHROMIUM_FLAGS='--no-sandbox --disable-gpu --user-data-dir --window-position=0,0'" > ${HOME}/.chromium-browser.init

RUN useradd --shell /sbin/nologin --home /app --uid 1000  -G users appuser
RUN mkdir /app && chown appuser -Rfv /app



ENV APP_NAME="Chromium"
WORKDIR /app
COPY startapp.sh /startapp.sh
USER root