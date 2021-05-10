ARG VARIANT="focal"

FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# Update ubuntu and install requirements
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
     apt-get -y upgrade && \
     apt-get -y install --no-install-recommends build-essential file cpio bc libncurses-dev
