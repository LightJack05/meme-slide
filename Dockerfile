FROM nginx:alpine-slim

COPY programming-memes/memes/1/* /usr/share/nginx/html/memes/
COPY programming-memes/memes/2/* /usr/share/nginx/html/memes/

COPY src/ /usr/share/nginx/html

WORKDIR /usr/share/licenses/programming-memes
COPY programming-memes/LICENSE /usr/share/licenses/programming-memes/

# Build a manifest of the available images for the page to pick from.
RUN ls -1 /usr/share/nginx/html/memes \
    | awk 'BEGIN { printf "[" } NF { printf "%s\"%s\"", (n++ ? "," : ""), $0 } END { print "]" }' \
    > /usr/share/nginx/html/memes.json
