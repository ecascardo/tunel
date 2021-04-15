echo 127.0.0.1      $1 | sudo tee -a /etc/hosts

cat << EOF | sudo tee -a /etc/nginx/conf.d/$1.conf
server {
        listen  80;
        server_name $1;
        location / {
            proxy_set_header    Host \$host;
            proxy_set_header    X-Real-IP   \$remote_addr;
            proxy_set_header    X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_pass  http://127.0.0.1:$2;
        }
}
EOF

sudo systemctl restart nginx

echo ssh -o ExitOnForwardFailure=yes -f -N -L $2:$1:80 localhost -p 2222 >> ~/tunel.sh
