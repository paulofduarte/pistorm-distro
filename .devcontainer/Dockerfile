ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# Set debconf to noninteractive and override required settings
ARG DEBIAN_FRONTEND=noninteractive
COPY debconf_selections /
RUN debconf-set-selections /debconf_selections && \
    dpkg-reconfigure dash && \
    rm /debconf_selections

# Update ubuntu and install dependencies
RUN apt update && \
    apt -y upgrade && \
    apt -y install --no-install-recommends build-essential chrpath diffstat gawk \
        libncurses5-dev python3-distutils texinfo