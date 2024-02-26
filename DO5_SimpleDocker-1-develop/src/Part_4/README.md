## Запуск 4 части задания

- `sudo docker build -t test:1 .` 

- `sudo docker run -d -p 80:81 -v /Users/annagorobec/DO5_SimpleDocker-1/src/Part_4/nginx/nginx.conf:/etc/nginx/nginx.conf test:1`

- `sudo docker ps`

- `curl localhost:80`

- `docker restart [name_conteiner]`

- `curl localhost:80/status`
