FROM debian:bullseye-slim

# Install curl and gnupg2
RUN apt-get update -y
RUN apt-get install -y \
    curl \
    gnupg2 \
    apt-transport-https \
    dnsutils

# Add docker apt repository
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" >> /etc/apt/sources.list \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    gettext-base \
    jq \
    docker-ce-cli \
    net-tools \ 
    python3 \
    python3-pip \
    python3-magic

# Install postgresql-client
RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
RUN sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN sudo apt-get update -y
RUN sudo apt-get install postgresql-client-15 -y

# Install mariadb-client
RUN sudo apt-get install mariadb-client -y

# Add new user ci and set sudo without password
RUN adduser --disabled-password --gecos "" ci
RUN echo "ci     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install kubectl from google official source
RUN curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Install ytt yaml templating tool
RUN curl -o /usr/local/bin/ytt -LO https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.45.3/ytt-linux-amd64 \
    && chmod +x /usr/local/bin/ytt

# Install scaleway cli
RUN sudo curl -o /usr/local/bin/scw -L "https://github.com/scaleway/scaleway-cli/releases/download/v2.16.1/scaleway-cli_2.16.1_linux_amd64"
RUN sudo chmod +x /usr/local/bin/scw

# Install s3cmd
RUN pip3 install s3cmd

# Cleanup
RUN apt-get clean -y

# Use ci user and run bash
USER ci

CMD ["bash"]
