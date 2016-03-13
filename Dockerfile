FROM qnib/alpn-nginx

ADD etc/consul-templates/nginx/window.conf.ctmpl /etc/consul-templates/nginx/
ADD etc/supervisord.d/nginx-conf.ini /etc/supervisord.d/
ADD opt/qnib/nginx/bin/conf.sh /opt/qnib/nginx/bin/

