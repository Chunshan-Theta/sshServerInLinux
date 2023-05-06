#!/bin/bash

# 設定 SSH 服務器的參數
SSH_PORT="22"  # 設置 SSH 服務器使用的端口
SSH_PERMIT_ROOT_LOGIN="no"  # 禁用 root 用戶登錄
SSH_PASSWORD_AUTHENTICATION="yes"  # 禁用密碼登錄
SSH_ALLOW_USERS="ssher"  # 允許登錄的用戶名，多個用空格分隔

# 更新系統和安裝所需軟件包
sudo apt update
sudo apt upgrade -y
sudo apt install -y openssh-server ufw

# 配置 SSH 服務器
sudo sed -i "s/Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
sudo sed -i "s/#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config

sudo sed -i "s/#PermitRootLogin yes/PermitRootLogin $SSH_PERMIT_ROOT_LOGIN/" /etc/ssh/sshd_config
sudo sed -i "s/#PermitRootLogin no/PermitRootLogin $SSH_PERMIT_ROOT_LOGIN/" /etc/ssh/sshd_config
sudo sed -i "s/PermitRootLogin yes/PermitRootLogin $SSH_PERMIT_ROOT_LOGIN/" /etc/ssh/sshd_config
sudo sed -i "s/PermitRootLogin no/PermitRootLogin $SSH_PERMIT_ROOT_LOGIN/" /etc/ssh/sshd_config


sudo sed -i "s/#PasswordAuthentication yes/PasswordAuthentication $SSH_PASSWORD_AUTHENTICATION/" /etc/ssh/sshd_config
sudo sed -i "s/#PasswordAuthentication no/PasswordAuthentication $SSH_PASSWORD_AUTHENTICATION/" /etc/ssh/sshd_config
sudo sed -i "s/PasswordAuthentication yes/PasswordAuthentication $SSH_PASSWORD_AUTHENTICATION/" /etc/ssh/sshd_config
sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication $SSH_PASSWORD_AUTHENTICATION/" /etc/ssh/sshd_config



sudo echo "AllowUsers $SSH_ALLOW_USERS" >> /etc/ssh/sshd_config



# 設置防火牆
sudo ufw allow $SSH_PORT/tcp
sudo ufw enable



# 重新啟動 SSH 服務器
sudo systemctl restart sshd

sudo adduser ssher
# sudo passwd ssher
