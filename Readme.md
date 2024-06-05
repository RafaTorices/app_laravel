# App Laravel

Project App Laravel with local deployment with docker and production deployment with Kubernetes

# Resources & Technologies

    - PHP 8.3.7
    - MySQL 8.0
    - Laravel 10

# Files

- [Dockerfile](Dockerfile) - File Dockerfile
- [compose.yaml](compose.yaml) - File Docker-compose
- [config/apache/000-default.conf](config/apache/000-default.conf) - Config site apache
- [app](app) - Folder files app

# Docker

```bash
docker build -t app-laravel .
docker run -d --name app -p 8000:80 app-laravel
```
>Note: until run docker build, you need modify the .env-example (/app/.env.example) file and set the correct values for your database, title, etc.

# Docker-compose

```
docker-compose up -d
```
>Note: until run docker build, you need modify the .env-example (/app/.env.example) file and set the correct values for your database, title, etc.





