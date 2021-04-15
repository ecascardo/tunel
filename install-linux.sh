sudo apt update
sudo apt install -y openssh-server nginx

cat > ~/tunel.sh << ENDOFFILE
killall ssh
ssh -o ExitOnForwardFailure=yes -f -N -D 12345 localhost -p 2222
ENDOFFILE

chmod +x ~/tunel.sh
