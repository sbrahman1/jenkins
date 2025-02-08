# Simple Example: Dockerfile
FROM alpine:latest
RUN apk add --no-cache curl
CMD ["echo", "Hello Shams!"]
