# Desafio: Definição de um Cluster Swarm Local com o Vagrant

Repositório estruturado para a automação e provisionamento de um cluster **Docker Swarm** multinó (1 Manager e 3 Workers) utilizando **Vagrant** e **VirtualBox**, garantindo uma arquitetura limpa, padronizada e pronta para ambiente de desenvolvimento.

---

## 📐 Arquitetura do Cluster

A infraestrutura é composta por quatro instâncias baseadas na imagem Ubuntu 22.04 (`bento/ubuntu-22.04`), interconectadas através de uma rede privada virtual (`10.10.10.0/24`):

| Hostname | Função | Endereço IP | Configuração de Hardware |
| :--- | :--- | :--- | :--- |
| **`master`** | Swarm Manager | `10.10.10.100` | 1 vCPU / 1024 MB RAM |
| **`node01`** | Swarm Worker | `10.10.10.101` | 1 vCPU / 1024 MB RAM |
| **`node02`** | Swarm Worker | `10.10.10.102` | 1 vCPU / 1024 MB RAM |
| **`node03`** | Swarm Worker | `10.10.10.103` | 1 vCPU / 1024 MB RAM |

---

## 🛠️ Descrição dos Arquivos do Projeto

- **`Vagrantfile`**: Define o mapeamento de hardware, redes estáticas e o ciclo de provisionamento sequencial das 4 VMs.
- **`docker.sh`**: Instala o Docker Engine e o Docker Compose de forma automatizada em todas as máquinas.
- **`master.sh`**: Inicializa o cluster Swarm no nó principal (`master`) e exporta automaticamente o token de acesso seguro.
- **`worker.sh`**: Configurado dinamicamente para conectar os nós `node01`, `node02` e `node03` ao gerenciador.

---

## 🚀 Como Executar o Projeto Localmente

1. Certifique-se de possuir o **VirtualBox** e o **Vagrant** instalados em sua máquina.
2. Na raiz do repositório, execute o comando de subida do ambiente:
   ```bash
   vagrant up
