FROM maven:3.9.0-eclipse-temurin-17-focal


RUN apt-get update \
    apt-get install software-properties-common \
    apt-get install -qy curl

# Soffice
RUN apt-add-repository --yes ppa:wasta-linux/libreoffice-7-3  \
    && apt-get update \
    && apt-get install -qy libreoffice

# Node JS
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash \
    && source ~/.bashrc \
    && nvm install 16.18.0 \
    && node -v

ENTRYPOINT ["sh", "-c"]

CMD ["java", "-version"]