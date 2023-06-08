# Laravel CRUD Boilerplate

## Overview & Installation

Laravel CRUD Boilerplate is a modified version of a MIT licensed sample project, laravel-react ( https://github.com/moeen-basra/laravel-react ).
I have removed front-end things and added some more convenient things, such as,

```shell
# For Git cloning, if you use WIN WSL2, I strongly recommend cloning on a WSL folder `\\wsl$\Ubuntu\home` not `c:\`. You use Mac, I don't know, as I don't have one. T.T

git clone https://github.com/Andrew-Kang-G/laravel-crud-boilerplate
cp .env.example.local .env

# on .env, you need to modify just one thing. "HOST_IP" (WIN WSL2 : host.docker.internal, Mac : docker.for.mac.localhost)

docker-compose build
docker-compose up -d

# You can see the building process by running 'docker logs -f lr_app'.
# You can get into the App container by running 'docker exec -it lr_app bash'. (As Dockerfile has been built as a ROOT user, you can do anything inside the container. However, considering security, add USER www-data on Dockerfile on production environments. 
```

## Prerequisite

For me, on WSL2,

- Docker version 20.10.23
- Docker Compose version v2.15.1

## Database

- It is automatically up as running `docker-compose up -d` above. 
- If you need to persist data continually, just uncomment `# ./.docker/db/data:/var/lib/mysql` on the docker-compose.yml.
- The transaction isolation level is at 'READ-COMMITTED' on the docker-compose.yml.

## Debugging
On the 'docker-compose.yml', 
`PHP_IDE_CONFIG: "serverName=laravel-crud-boilerplate"` And
![img.png](/reference/readme/img.png)

must be the same, 'laravel-crud-boilerplate'.

Additionally, set the port to be 9002.
![img2.png](/reference/readme/img2.png)

## Test APIs
Postman API files are on `./reference/postman`

## Test Codes

T.T. Not yet.



