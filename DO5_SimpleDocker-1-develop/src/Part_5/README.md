Вывод Dockle: 

![Alt text](<Снимок экрана 2023-12-12 в 15.40.16.png>)

- `export DOCKER_CONTENT_TRUST=1`

- `docker build -t test:1 .`

- `dockle -ak NGINX_GPGKEY_PATH -ak NGINX_GPGKEY test:1`

- `docker run -d -p 80:81 -v /Users/annagorobec/DO5_SimpleDocker-1/src/Part_5/nginx/nginx.conf:/etc/nginx/nginx.conf test:1`

- `curl localhost:80`

- `curl localhost:80/status`
