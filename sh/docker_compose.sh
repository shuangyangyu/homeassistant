#!bin/bash
#检查环境
whoami
uname -a

#卸载软件
sudo apt-get remove docker docker-engine docker.io containerd runc  
#安装软件
sudo apt-get update  
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://u5sbtggv.mirror.aliyuncs.com \
   $(lsb_release -cs) \
   stable" 
sudo apt-get update 
sudo apt-get install docker-ce docker-ce-cli containerd.io 
sudo docker run hello-world 

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://u5sbtggv.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
#安装docker-compose


sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose- (uname−s)−(uname−s)− (uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

#查看软件是否安装成功
