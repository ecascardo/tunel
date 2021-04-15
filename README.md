# Installation on Mac

1- Enable SSH
https://uca.edu/it/knowledgebase-legacy/enabling-ssh-on-a-mac-computer/

2- Install Caffeine 
https://formulae.brew.sh/cask/caffeine

3- Replace LINUX_IP for your real linux IP and run in terminal
```bash
curl https://raw.githubusercontent.com/ecascardo/tunel/master/install-mac.sh | sh -s LINUX_IP
```
# Installation on Linux

1- Run in terminal
```bash
curl https://raw.githubusercontent.com/ecascardo/tunel/master/install-linux.sh | sh
```

2- Replace HOST_TUNEL_PROXY and TUNEL_PORT and run in terminal for each host
```bash
curl https://raw.githubusercontent.com/ecascardo/tunel/master/add-proxy.sh | sh -s HOST_TO_PROXY TUNEL_PORT
```

3- In Firefox configure proxy SOCKS Host:localhost Port:12345

# Run

1- Terminal In Mac
```bash
~/tunel.sh
```

2- Connect to VPN

3- Terminal in Linux
```bash
~/tunel.sh
```
