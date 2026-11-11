#!/bin/bash

# Inicializa o Docker Swarm na interface com o IP fixo da master
sudo docker swarm init --advertise-addr=10.10.10.100

# Captura a linha de join gerada e salva o script completo para os workers
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh