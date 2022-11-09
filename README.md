# DIO Docker

## Descrição

Neste projeto o expert utilizou o Docker Compose para executar uma aplicação HTML em um Container Apache. Você poderá ir além e fazer alterações mais robustas ao seu projeto, estilizando sua página e utilizando seus conhecimentos em (HTML, CSS e JS). Você também pode buscar outras formas para executar seu arquivo HTML em outras Linguagens de Programação.

### PASSO A PASSO

- *1:* Criar um arquivo YML com as definições de um servidor Apache (httpd);

- *2:* Especificar no arquivo YML o local onde os arquivos da aplicação estarão. A aplicação pode ser um simples Hello World. Será que você consegue executar uma aplicação web completa?

- *3:* Subir o arquivo YML e a aplicação para um repositório no GitHub.

```bash
sudo apt -y install docker.io
```

```bash
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
```

```bash
mkdir -p Docker
cd Docker
```

```bash
echo 'FROM ubuntu:22.04

LABEL author="Admin"

RUN apt-get update \
    && apt-get -y install apache2 apache2-utils \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt-get/lists/* /tmp/* /var/tmp/* \
    && echo "Hello World" | tee /var/www/html/index.html

EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]' | tee Dockerfile
```

```bash
echo 'FROM ubuntu:22.04

LABEL author="Admin"

RUN apt-get update
RUN apt-get -y install apache2 apache2-utils
RUN apt-get -y autoremove
RUN apt-get -y clean
RUN rm -rf /var/lib/apt-get/lists/* /tmp/* /var/tmp/*
#RUN echo "Hello World" | tee /var/www/html/index.html

EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]' | tee Dockerfile
```

```bash
docker image build -t ubuntu_jammy_apache:latest .
```

```bash
docker container run -d --restart unless-stopped -p 8181:80 --name=ubuntu_web001 -t ubuntu_jammy_apache:latest
```
