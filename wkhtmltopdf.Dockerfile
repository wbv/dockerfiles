FROM debian:bullseye-slim

# add wkhtmltopdf debian package
WORKDIR /tmp
ARG RELEASE="0.12.6.1-2"
ARG PACKAGENAME="wkhtmltox_0.12.6.1-2.bullseye_amd64.deb"
ARG REPO="wkhtmltopdf/packaging"
ADD https://github.com/$REPO/releases/download/$RELEASE/$PACKAGENAME /tmp

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq \
 && apt-get install -qq -y --no-install-recommends \
      ./"$PACKAGENAME" \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/wkhtmltopdf", "--enable-local-file-access"]
CMD ["--help"]
