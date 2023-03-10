FROM maven:3.9.0-eclipse-temurin-17-focal

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get install -qy software-properties-common \
    && apt-get install -qy curl

# Soffice
RUN apt-add-repository --yes ppa:wasta-linux/libreoffice-7-3  \
    && apt-get update \
    && apt-get install -qy libreoffice

# Node JS
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash \
    && source ~/.bashrc \
    && nvm install 16.18.0 \
    && node -v
SHELL ["/bin/bash", "--login", "-c"]

ENTRYPOINT ["/bin/bash", "-c"]

CMD ["java", "--version"]