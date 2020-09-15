#!bin/bash
read -p "Do you want install docker-compose?"PASSWD
SUDO=echo $PASSWD | sudo -S


$SUDO apt-get remove docker docker-engine docker.io containerd runc  
$SUDO apt-get update  
$SUDO apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add aliyuns_marror
$SUDO add-apt-repository \
   "deb [arch=amd64] https://u5sbtggv.mirror.aliyuncs.com \
   $(lsb_release -cs) \
   stable" 
$SUDO apt-get update  
$SUDO apt-get install docker-ce docker-ce-cli containerd.io 

#add aliyuns_marror_speed

$SUDO mkdir -p /etc/docker
$SUDO tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://u5sbtggv.mirror.aliyuncs.com"]
}
EOF
$SUDO systemctl daemon-reload

$SUDO systemctl restart docker

$SUDO docker run hello-world 

while true; do
    read -p "Do you want install docker-compose?" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

$SUDO curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose- (uname−s)−(uname−s)− (uname -m)" -o /usr/local/bin/docker-compose
$SUDO chmod +x /usr/local/bin/docker-compose
docker-compose --version
