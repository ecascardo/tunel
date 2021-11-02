
cat > ~/tunel.sh << ENDOFFILE
killall ssh
ssh -o ExitOnForwardFailure=yes -f -N -R 2222:localhost:22  $1
ENDOFFILE
chmod +x ~/tunel.sh
