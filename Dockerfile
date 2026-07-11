FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 4000

CMD ["nginx", "-g", "daemon off;"]
