
echo "Type the linux IP, followed by [ENTER]:"

read ip

cat > ~/tunel.sh << ENDOFFILE
killall ssh
ssh -o ExitOnForwardFailure=yes -f -N -R 2222:localhost:22  $ip
ENDOFFILE
chmod +x ~/tunel.sh
