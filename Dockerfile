FROM bitnami/nginx:latest

COPY --chown=1001:1001 index.html /app/index.html
