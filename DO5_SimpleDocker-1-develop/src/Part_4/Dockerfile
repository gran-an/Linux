FROM nginx
WORKDIR /home/
USER root

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY main.c /home/main.c
COPY start.sh /home/start.sh

RUN apt-get update ;\
 	apt-get install -y gcc spawn-fcgi libfcgi-dev; \
	chmod 777 start.sh
    
ENTRYPOINT ["sh", "./start.sh"]