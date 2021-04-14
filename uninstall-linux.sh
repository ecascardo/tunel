sed -i "/maven.artifacts.furycloud.io/d" /etc/hosts
sed -i "/maven.melicloud.com/d" /etc/hosts

FILE=~/tunel.sh
if test -f "$FILE"; then
    rm $FILE
fi

FILE=/etc/nginx/conf.d/tunel.conf 
if test -f "$FILE"; then
    rm $FILE
fi
