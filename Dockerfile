# Use Jenkins LTS Base Image
FROM jenkins/jenkins:lts
# As root
USER root
# Install lsb-release Package
RUN apt-get update && apt-get install -y lsb-release
# Download Docker Keyring
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
# Add Docker Repository
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
# Update and install docker-ce-cli
RUN apt-get update && apt-get install -y docker-ce-cli
# add nodejs 20 repo
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash
# install nodejs
RUN apt install nodejs -y
# Add Github Labels
LABEL org.opencontainers.image.source https://github.com/Nightwire/docker-jenkins
# Switch user to Jenkins
USER jenkins
