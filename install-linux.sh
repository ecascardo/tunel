apt update
apt install -y openssh-server nginx

echo 127.0.0.1      maven.melicloud.com >> /etc/hosts
echo 127.0.0.1      maven.artifacts.furycloud.io >> /etc/hosts

cat > /etc/nginx/conf.d/tunel.conf << ENDOFFILE
server {
        listen  80;
        server_name maven.melicloud.com;
        location / {
            proxy_set_header    Host \$host;
            proxy_set_header    X-Real-IP   \$remote_addr;
            proxy_set_header    X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_pass  http://127.0.0.1:7000;
        }
}

server {
        listen  80;
        server_name maven.artifacts.furycloud.io;
        location / {
            proxy_set_header    Host \$host;
            proxy_set_header    X-Real-IP   \$remote_addr;
            proxy_set_header    X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_pass  http://127.0.0.1:7001;
        }
}
ENDOFFILE
systemctl restart nginx

cat > ~/tunel.sh << ENDOFFILE
killall ssh
ssh -o ExitOnForwardFailure=yes -f -N -D 12345 localhost -p 2222
ssh -o ExitOnForwardFailure=yes -f -N -L 7000:maven.melicloud.com:80 localhost -p 2222
ssh -o ExitOnForwardFailure=yes -f -N -L 7001:maven.artifacts.furycloud.io:80 localhost -p 2222
ENDOFFILE
chmod +x ~/tunel.sh


