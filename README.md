## Requirements
- Python
- Pip
- Digital Ocean
- Terraform
- Ansible
- Kubernetes

## Terraform

Create a cluster kubernetes on Digital Ocean with size 2gb RAM and 1 CPU.

1 - Create a .tfvars file for your Digital Ocean token inside directory terraform/:

terraform.tfvars:
```
do_token = "TOKEN"
```
2 - Execute inside directory terraform/:

```
terraform apply
```

To delete the cluster, run:
```
terraform destroy
```

## Ansible

1 - The playbook "playbook.yaml" will apply the kubernets manifests on the cluster, populate the api and install metrics server and prometheus on the cluster using helm.

Run:
```
ansible-playbook ansible/playbook.yaml
```

At the end of the execution, the ip address of the api will be displayed.

2 - The playbook "remove.yaml" will remove the manifests from kubernetes and uninstall helm and prometheus from the cluster.

Run:
```
ansible-playbook ansible/remove.yaml
```

## Accessing api
https://ip_adress:8000/api/comment/list/1  
https://ip_adress:8000/api/comment/list/2  