FROM bitnami/nginx:latest

USER root

RUN mkdir -p /tmp/nginx/client_temp && \
    chmod -R 777 /tmp/nginx && \
    chown -R 1001:1001 /tmp/nginx

COPY --chown=1001:1001 index.html /app/index.html

USER 1001
