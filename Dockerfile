FROM ubuntu:18.04

MAINTAINER Kautik Kheni

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf 
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/kautikkumar/itelnets.git 
RUN cd itelnets && git pull && mv  * /var/www/html/
#COPY index.html /var/www/html/index.nginx-debian.html
#RUN rm -rf /etc/nginx/sites-available/default
#ADD default /etc/nginx/sites-available/default
#ADD default /etc/nginx/sites-available/default

#EXPOSE 8822
CMD ["nginx"]