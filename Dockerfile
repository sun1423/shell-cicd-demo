FROM nginx:alpine

USER root

RUN mkdir -p /tmp/nginx/client_temp \
             /tmp/nginx/proxy_temp \
             /tmp/nginx/fastcgi_temp \
             /tmp/nginx/uwsgi_temp \
             /tmp/nginx/scgi_temp && \
    chmod -R 777 /tmp/nginx && \
    chown -R nginx:nginx /tmp/nginx && \
    sed -i 's|/var/cache/nginx|/tmp/nginx|g' /etc/nginx/nginx.conf && \
    sed -i 's|listen       80;|listen       8080;|g' /etc/nginx/conf.d/default.conf && \
    sed -i 's|listen  \[::\]:80;|listen  [::]:8080;|g' /etc/nginx/conf.d/default.conf && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /etc/nginx && \
    chown -R nginx:nginx /usr/share/nginx/html && \
    touch /var/run/nginx.pid && \
    chown nginx:nginx /var/run/nginx.pid

COPY --chown=nginx:nginx index.html /usr/share/nginx/html/index.html

USER nginx
