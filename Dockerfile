FROM openjdk:8-jdk-slim

# Install goodies
RUN apt-get update && \
    apt-get install -y gnupg curl git vim tar make g++
    
# Install node on top of jdk
RUN set -x \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y \
        nodejs \
    && npm install -g npm@latest yarn@latest

# Check versions
# RUN node -v
# RUN npm -v
# RUN yarn -v
# RUN java -version

# do the cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/*
