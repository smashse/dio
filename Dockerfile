FROM ubuntu:22.04

LABEL author="Admin"

RUN apt-get update
RUN apt-get -y install apache2 apache2-utils
RUN apt-get -y autoremove
RUN apt-get -y clean
RUN rm -rf /var/lib/apt-get/lists/* /tmp/* /var/tmp/*
#RUN echo "Hello World" | tee /var/www/html/index.html

EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
