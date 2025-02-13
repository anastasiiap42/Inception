FROM alpine:3.20

RUN	apk update && apk upgrade && apk add --no-cache nginx sudo wget curl openssl

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]