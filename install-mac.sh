brew install caffeine

brew install squidman

rm ~/tunel.sh 
rm -rf vpn.workflow

cat > ~/tunel.sh << ENDOFFILE

echo "-----------Disconecting Tunel---------------"
killall ssh

echo "----------Disconecting Tunel----------------"
ssh -o ExitOnForwardFailure=yes -f -N -R 2222:localhost:22     $1
ssh -o ExitOnForwardFailure=yes -f -N -R 8888:localhost:8888   $1 
ssh -o ExitOnForwardFailure=yes -f -N -R 5900:localhost:5900   $1

echo "-----------Conecting VPN--------------------"
automator -v vpn.workflow

ENDOFFILE
chmod +x ~/tunel.sh
