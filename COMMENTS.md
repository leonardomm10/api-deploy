## Ferramentas Utilizadas  

- **Digital Ocean**  
  Utilizei a Digital Ocean pois é uma cloud que ja tenho conhecimento e ja estava fazendo alguns testes com kubernetes e terraform.  
  
- **Terraform**  
  Utilzando para subir o ambiente com o cluster Kubernetes.  

- **Kubernetes**  
  Utilizado para subir a api. 

- **Ansible**  
  Utilizado para automatizar algumas configurações relacionadas ao cluster kubernetes e para fazer as requisiçoes de post da API.   
  
- **GitHub Actions**  
  Utilizado para fazer a pipeline.

- **Prometheus**  
  Utilizado para o monitoramento.  


## Funcionamento  

**1.** O Terraform cria um cluster Kubernetes na Digital Ocean com apenas 1 node de 2GB de Ram e 1 CPU, apos a criação ele salva o arquivo de configuração do Kubernetes dentro de um arquivo.  

**2.** Os manifestos do Kubernetes criam um deployment e service para o servidor Web (nginx) que faz um proxy para o serviço da API que possui um deployment com a Imagem da API em python no Docker Hub.  

**3.** Foram criados 2 playbooks com o ansible para automatizar alguns tarefas, entre elas:  
- Aplicar os manifestos do Kubernetes no cluster.
- Configurar e Instalar o Metrics Server e Prometheus no cluster utilizando Helm.
- Fazer as requisiçoes POST para a API.
- Remover os manifestos do cluster Kubernetes.
- Remover o Metrics Server e Prometheus.  

**4.** Para fazer a pipeline foram criadas 2 branches no GitHub (staging e main), as alterações no código são feitas dentro da branch staging e assim que é feito o merge, vão para a main, a pipeline é ativada quando há alguma alteração na branch main dentro do diretório app/, onde ela executa os seguintes passos:
- Faz o build da imagem do Dockerfile.
- Faz o push da imagem no DockerHub.
- Aplica as alterações dentro do cluster Kubernetes.  

**5.** Com prometheus tive dificuldade para configurar as métricas, então ele só esta pegando as métricas do cluster e não da API.
