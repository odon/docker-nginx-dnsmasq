FROM library/nginx

MAINTAINER PolishDeveloper Piotr Miazga "piotr@polishdeveloper.pl"

RUN apt-get update && \
    apt-get install -y dnsmasq

RUN echo "\n\n# Docker extra config \nuser=root\naddn-hosts=/etc/hosts\n" >> /etc/dnsmasq.conf
RUN service dnsmasq stop \
    service dnsmasq start

EXPOSE 53 80 443

CMD ["nginx", "-g", "daemon off;"]
