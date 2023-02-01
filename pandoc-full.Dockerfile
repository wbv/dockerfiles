# syntax=docker/dockerfile:1

FROM debian:bullseye

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
RUN apt-get -q update \
 && apt-get install -y \
      pandoc \
      pandoc-citeproc \
      texlive-latex-recommended \
      texlive-xetex \
      texlive-luatex \
      texlive-latex-extra \
      texlive-fonts-recommended \
      texlive-fonts-extra \
      fonts-roboto \
      fonts-noto \
      context \
      librsvg2-bin \
      groff \
      wget \
 && rm -rf /var/lib/apt/lists/*

# install patched (upstream) version of wkhtmltopdf
RUN cd /tmp \
 && wget -q https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.bullseye_amd64.deb \
 && apt-get -q update \
 && apt-get install -y \
      ./wkhtmltox_0.12.6.1-2.bullseye_amd64.deb \
 && rm -vf ./wkhtmltox_0.12.6.1-2.bullseye_amd64.deb \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /data
ENTRYPOINT ["/usr/bin/pandoc"]
