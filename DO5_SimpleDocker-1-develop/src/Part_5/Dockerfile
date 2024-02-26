FROM nginx
WORKDIR /home/


USER root
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY main.c /home/main.c
COPY start.sh /home/start.sh
RUN groupadd --gid 2000 node \
    && useradd --uid 2000 --gid node --shell /bin/bash --create-home node

RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    apt-get clean && rm -rf /var/lib/apt/lists/* ;\
    chown -R 2000:2000 /etc/nginx/nginx.conf

RUN chown -R 2000:2000 /var/cache/nginx; \
     chown -R 2000:2000 /home; \
     touch /var/run/nginx.pid; \
     chown -R 2000:2000 /var/run/nginx.pid;\
     chmod u-s /usr/bin/gpasswd; \
     chmod u-s /usr/bin/newgrp; \
     chmod u-s /bin/su; \
     chmod u-s /bin/mount; \
     chmod u-s /bin/umount; \
     chmod u-s /usr/bin/chfn; \
     chmod u-s /usr/bin/chsh; \
     chmod 255 /usr/bin/expiry; \
     chmod 255 /usr/bin/wall; \
     chmod 255 /sbin/unix_chkpwd; \
     chmod 255 /usr/bin/chage; \
     chmod 755 /usr/bin/passwd

USER 2000
HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1
ENTRYPOINT ["sh", "start.sh"]

