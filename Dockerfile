FROM docker.io/nginxinc/nginx-unprivileged:1.31.7-alpine-slim@sha256:a8cb0f33d51fa107c96fd2bd3a71aaf564ec131e9d2bdf8700944f0ed8b170d7
COPY --chown=101:101 site/ /usr/share/nginx/html/
EXPOSE 8080
