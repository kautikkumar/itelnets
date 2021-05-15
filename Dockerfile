FROM ubuntu:18.04

MAINTAINER Kautik Kheni

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf 
RUN apt-get update && apt-get install -y git
RUN mkdir Kautik 
RUN mkdir /Kautik/html && cd /Kautik/html/ && git clone https://github.com/kautikkumar/itelnets.git 
RUN cd /Kautik/html/itelnets && git pull && cp -r * /var/www/html/
#RUN mkdir /Kautik/script && cd /Kautik/script/ && git clone -b script https://github.com/kautikkumar/itelnets.git
#RUN cd /Kautik/script/itelnets && git pull
#COPY index.html /var/www/html/index.nginx-debian.html
#RUN rm -rf /etc/nginx/sites-available/default
#ADD default /etc/nginx/sites-available/default
#ADD default /etc/nginx/sites-available/default

#EXPOSE 8822
CMD ["nginx"]