FROM bitnami/nginx:latest

USER root

RUN mkdir -p /tmp/client_temp \
             /tmp/proxy_temp \
             /tmp/fastcgi_temp \
             /tmp/uwsgi_temp \
             /tmp/scgi_temp \
             /opt/bitnami/nginx/logs \
             /opt/bitnami/nginx/tmp && \
    chmod -R 777 /tmp && \
    chown -R 1001:1001 /tmp && \
    chown -R 1001:1001 /opt/bitnami/nginx

RUN printf 'worker_processes auto;\n\
events {\n\
    worker_connections 1024;\n\
}\n\
http {\n\
    client_body_temp_path /tmp/client_temp;\n\
    proxy_temp_path /tmp/proxy_temp;\n\
    fastcgi_temp_path /tmp/fastcgi_temp;\n\
    uwsgi_temp_path /tmp/uwsgi_temp;\n\
    scgi_temp_path /tmp/scgi_temp;\n\
    include /opt/bitnami/nginx/conf/mime.types;\n\
    default_type application/octet-stream;\n\
    server {\n\
        listen 8080;\n\
        root /app;\n\
        index index.html;\n\
    }\n\
}\n' > /opt/bitnami/nginx/conf/nginx.conf

COPY --chown=1001:1001 index.html /app/index.html

USER 1001
