FROM python:3.9.10-slim-bullseye

ENV DEBIAN_FRONTEND noninteractive
ENV GECKODRIVER_VER v0.30.0
ENV FIREFOX_VER 97.0.1

RUN set -x \
   && apt-get update \
   && apt-get upgrade -y \
   && apt-get install -y \
       curl \
       bzip2 \
       xvfb \
   && pip install  \
       requests \
       selenium

# Add geckodriver
RUN set -x \
   && curl -sSLO https://github.com/mozilla/geckodriver/releases/download/${GECKODRIVER_VER}/geckodriver-${GECKODRIVER_VER}-linux64.tar.gz \
   && tar zxf geckodriver-*.tar.gz \
   && mv geckodriver /usr/local/bin \
   && chmod 755 /usr/local/bin/geckodriver

RUN set -x \
&& echo "deb http://deb.debian.org/debian/ unstable main contrib non-free" >> /etc/apt/sources.list.d/debian.list \
&& apt-get update \
&& apt-get install -y --no-install-recommends firefox

COPY ./app /app
 
WORKDIR /app
 
CMD python ./main.py

# CMD firefox --version