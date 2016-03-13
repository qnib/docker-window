FROM qnib/alpn-nginx

ADD etc/ssl/nginx/certificate.crt \
    etc/ssl/nginx/certificate.key \
    /etc/ssl/nginx/
ADD etc/consul-templates/nginx/window.conf.ctmpl \
    etc/consul-templates/nginx/http.html.ctmpl \
    etc/consul-templates/nginx/https.html.ctmpl \
    /etc/consul-templates/nginx/
ADD etc/supervisord.d/nginx-conf.ini /etc/supervisord.d/
ADD opt/qnib/nginx/bin/conf.sh /opt/qnib/nginx/bin/
ADD etc/consul.d/nginx.json /etc/consul.d/
