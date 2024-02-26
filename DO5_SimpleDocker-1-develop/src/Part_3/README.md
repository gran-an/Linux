## Запуск проекта

-  `docker pull nginx`

- `docker run -p 80:80 -p 81:81 Image`

- `docker cp main.c cont_name:/home/main.c`

- `docker exec -it cont_name bash`

- `apt-get update`

- `apt-get install -y gcc spawn-fcgi libfcgi-dev`

- `gcc /home/main.c-lfcgi -o main`

- `spawn-fcgi -p 8080 ./main`

- `docker cp ./Part_3/nginx.conf cont_name:/home/main.c`

- `docker exec -it cont_name bash`

- `nginx -s reload`

- `curl localhost:81`