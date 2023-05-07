#!/bin/bash

# 設置防火牆
sudo ufw enable

# 重新啟動 SSH 服務器
sudo systemctl restart sshd
