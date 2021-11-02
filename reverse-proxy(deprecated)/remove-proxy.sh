sudo sed -i "/$1/d" /etc/hosts
sed -i "/$1/d" ~/tunel.sh

FILE=/etc/nginx/conf.d/$1.conf 
if test -f "$FILE"; then
    sudo rm $FILE
fi

sudo systemctl restart nginx
