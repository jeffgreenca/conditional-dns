FROM alpine:latest
# Based on the work of resyst-it <florian.cauzardjarry@gmail.com>
RUN apk --update add bind
COPY ./*.conf /etc/bind/
# If the config does not validate, fail the build
RUN named-checkconf 
EXPOSE 53
CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
