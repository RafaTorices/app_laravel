# App Laravel

Project App Laravel with local deployment with docker and production deployment with Kubernetes

# Files

- [Dockerfile](Dockerfile) - File Dockerfile
- [Compose.yaml](compose.yaml) - File Docker-compose
- [config/apache/000-default.conf](config/apache/000-default.conf) - Config site apache
- [app](app) - Folder files app

# Docker

```bash
docker build -t app-laravel .
docker run -p 8000:80 app-laravel
```
>Note: modify the .env file with the database configuration

# Docker-compose

```
docker-compose up -d
```



