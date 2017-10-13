FROM nginx:1.10.2
MAINTAINER Kyle Mathews "mathews.kyle@gmail.com"

RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types
COPY nginx.conf /etc/nginx/nginx.conf
COPY basic.conf /etc/nginx/basic.conf
COPY mime.types /etc/nginx/mime.types
RUN mkdir /etc/nginx/ssl
COPY default /etc/nginx/sites-available/default
COPY default-ssl /etc/nginx/sites-available/default-ssl
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/default-ssl /etc/nginx/sites-enabled/
COPY directive-only /etc/nginx/directive-only
COPY location /etc/nginx/location

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443

CMD ["nginx"]

