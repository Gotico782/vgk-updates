#!/bin/bash
apt install -y nginx
mkdir -p /etc/nginx/ssl
openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/cert.pem -days 365 -subj /CN=supremacy.cloud
curl -o /etc/nginx/sites-available/vgk-proxy https://raw.githubusercontent.com/Gotico782/vgk-updates/main/nginx.conf
ln -sf /etc/nginx/sites-available/vgk-proxy /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
nginx -t
systemctl restart nginx
curl -k https://localhost/v1/session
echo DONE
