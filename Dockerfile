FROM nginx:alpine-slim@sha256:4c734d33ee731135dc9f2349914a34551c920f4451fca8bb05bf5880eb9079e8

WORKDIR /memes

COPY programming-memes/memes/1/* /usr/share/nginx/html/memes/
COPY programming-memes/memes/2/* /usr/share/nginx/html/memes/

COPY src/ /usr/share/nginx/html
