FROM openjdk:8-jre-alpine
RUN addgroup -g 1000 -S alpine && \
    adduser -u 1000 -G alpine -h /home/alpine -D alpine
RUN apk update && \
    apk add --no-cache --update busybox-extras unzip vim tzdata net-tools curl procps && rm -rf /var/cache/apk/*
RUN apk add --no-cache tzdata
ENV TZ Asia/Jakarta
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime

ENTRYPOINT ["java","-jar", "aplikasi.jar"]
