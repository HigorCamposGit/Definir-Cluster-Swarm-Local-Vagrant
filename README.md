# Desafio: Definição de um Cluster Swarm Local com o Vagrant

---
* 🔒 Nota de Segurança: Credenciais locais de infraestrutura detectadas automaticamente foram removidas e revogadas por precaução, garantindo a integridade e segurança pública do repositório.Recebi um e-mail: [HigorCamposGit/Definir-Cluster-Swarm-Local-Vagrant] Possible valid secrets detected. Tokem foi removido!!
  
---

Repositório estruturado para a automação e provisionamento de um cluster **Docker Swarm** multinó (1 Manager e 3 Workers) utilizando **Vagrant** e **VirtualBox**, garantindo uma arquitetura limpa, padronizada e pronta para ambiente de desenvolvimento. Porjeto realizado para a **Formação Docker Fundamentals**. ( `com a descrição do desafio extra mais abaixo`)


---

## 👨‍🏫 Créditos e Referências

Este projeto foi desenvolvido como parte de um desafio prático da plataforma **DIO (Digital Innovation One)**, sob a orientação e projeto base do professor:

- **Instrutor:** [Denilson Bonatti](https://github.com/denilsonbonatti)
- **Repositório de Referência:** [denilsonbonatti/docker-projeto2-cluster](https://github.com/denilsonbonatti/docker-projeto2-cluster)
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
   ```

   ---
 1. Para acessar o nó gerenciador e interagir com o cluster:
   ```bash
   vagrant ssh marter
   ```
  
 ---
 
2. 📊 Validação e Resultados Esperados
Após o provisionamento completo, ao acessar a máquina master e listar os nós do cluster:
```bash
   sudo docker node ls
   ```
---
Saída esperada no terminal:

ID                            HOSTNAME   STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
x8z9a0b1c2d3e4f5g6h7i8j9k *   master     Ready     Active         Leader           24.0.5
l1m2n3o4p5q6r7s8t9u0v1w2x     node01     Ready     Active                          24.0.5
y3z4a5b6c7d8e9f0g1h2i3j4k     node02     Ready     Active                          24.0.5
k9j8i7h6g5f4e3d2c1b0a9z8y     node03     Ready     Active                          24.0.5

---
🧪 Validação Avançada: Containers, Serviços e Persistência de Dados ** (Desafio Extra) **
Seção dedicada a atender aos testes práticos de orquestração de cargas de trabalho, criação de serviços distribuídos, volumes e manipulação de arquivos no cluster Swarm.

Para validar a execução de aplicações e persistência diretamente pelo nó master, utilize os comandos abaixo:

1. Criar um Serviço Replicado (Nginx)
Implantação de um serviço web distribuído automaticamente entre os nós do cluster com 3 réplicas ativas:

 ```bash
   docker service create --name meu-servico-web --replicas 3 -p 8080:80 nginx:alpine
   ```

---

2. Verificar a Distribuição dos Containers:
   ```bash
   docker service ps meu-servico-web
   ```
---
3. Teste de Volumes e Criação de Arquivos Persistentes
Criação de um volume nomeado no cluster para armazenamento e gravação de arquivos de teste dentro de um container em execução:

* Criar o volume gerenciado*
docker volume create dados_compartilhados

* Subir um container utilizando o volume criado *
docker service create \
  --name app-storage \
  --mount type=volume,src=dados_compartilhados,dst=/app/data \
  alpine tail -f /dev/null

* Criar e injetar um arquivo de teste dentro do container ativo *
docker exec -it $(docker ps -q -f name=app-storage) sh -c "echo 'Arquivo de teste criado com sucesso no Swarm' > /app/data/teste.txt"

---
4. Escalonamento Dinâmico de Serviços
Para redimensionar a capacidade da aplicação em tempo real:
```bash
   docker service scale meu-servico-web=6
   ```

---
## 🤝 Conecte-se Comigo

<p align="center">
  <img src="https://github.com/HigorCamposGit.png" width="100px" style="border-radius: 50%;" alt="Foto de Higor de Campos" /><br />
  <b>Projeto atualizado por:</b> <a href="https://github.com/HigorCamposGit">Higor de Campos</a>
</p>

---
---
[https://github.com/HigorCamposGit/Definir-Cluster-Swarm-Local-Vagrant](https://github.com/HigorCamposGit/Definir-Cluster-Swarm-Local-Vagrant)).

   
