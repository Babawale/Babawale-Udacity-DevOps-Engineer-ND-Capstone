FROM nginx:1.19.2

RUN rm /usr/share/nginx/html/index.html

COPY index.html /usr/share/nginx/html

EXPOSE 80
