FROM nginx
WORKDIR /home/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY start.sh /home/start.sh
RUN chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid
USER nginx
ENTRYPOINT ["sh", "start.sh"]

