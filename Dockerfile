FROM nginx
LABEL MAINTAINER=jsolano@spartaglobal.com
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
