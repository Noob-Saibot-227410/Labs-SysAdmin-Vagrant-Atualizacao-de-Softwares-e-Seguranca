#!/bin/bash

# Instala as ferramentas de segurança
sudo apt-get install ufw fail2ban -y

# Configura o firewall
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow from 192.168.33.1/24 to any port 80 proto tcp
sudo ufw allow from 192.168.33.1/24 to any port 443 proto tcp
sudo ufw reload

# Configura o fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo sed -i 's/# bantime = 10m/bantime = 1h/' /etc/fail2ban/jail.local
sudo systemctl enable fail2ban
sudo systemctl start fail2ban