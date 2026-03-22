FROM registry.access.redhat.com/ubi8/nginx-120

COPY --chown=1001:0 index.html /usr/share/nginx/html/index.html

CMD nginx -g "daemon off;"
