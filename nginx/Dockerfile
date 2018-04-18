From nginx:1.12.2-alpine
RUN apk update && apk add tzdata
#opt.1
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#opt.2
#RUN echo "Aisa/Shanghai" > /etc/timezone
#opt.3
#ENV TZ "Aisa/Shanghai"
