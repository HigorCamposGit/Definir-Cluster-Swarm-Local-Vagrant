#!/bin/bash

# Atualizar e instalar Docker Engine oficial
curl -fsSL https://get.docker.com | sudo bash

# Instala o Docker Compose 
sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Permite que a execução do Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Adiciona o usuário vagrant ao grupo docker
sudo usermod -aG docker vagrant