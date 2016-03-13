#!/usr/local/bin/dumb-init /bin/bash

consul-template -consul localhost:8500 -template "/etc/consul-templates/nginx/window.conf.ctmpl:/etc/nginx/conf.d/window.conf:nginx -s reload" \
                                       -template "/etc/consul-templates/nginx/http.html.ctmpl:/usr/share/nginx/html/index.html" \
                                       -template "/etc/consul-templates/nginx/https.html.ctmpl:/usr/share/nginx/htmls/index.html"
