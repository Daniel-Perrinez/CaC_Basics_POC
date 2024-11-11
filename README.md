# CaC_Basics_POC
Configuration as Code basics for presentations and POCs

### Ansible Best Practices
```
Establish a manual connection to a managed node
- ssh user@ip.example.net
Run a command:
ansible all -i vyos.example.net, -c ansible.netcommon.network_cli -u my_vyos_user -k -m vyos.vyos.vyos_facts -e ansible_network_os=vyos.vyos.vyos

The flags in this command set seven values:
    the host group(s) to which the command should apply (in this case, all)
    the inventory (-i, the device or devices to target - without the trailing comma -i points to an inventory file)
    the connection method (-c, the method for connecting and executing ansible)
    the user (-u, the username for the SSH connection)
    the SSH connection method (-k, please prompt for the password)
    the module (-m, the Ansible module to run, using the fully qualified collection name (FQCN))
    an extra variable ( -e, in this case, setting the network OS value)

- Run the playbook
ansible-playbook -i vyos.example.net, -u ansible -k -e ansible_network_os=vyos.vyos.vyos first_playbook.yml
```

### Terraform Best Practices
https://developer.hashicorp.com/terraform/language/style
Before committing your code to version control.
```
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"

cd CaC_Basics_POC/Cloud/AWS_TF

terraform fmt
terraform validate
tflint

terraform init
terraform plan
terraform apply
```

```
terraform destroy -target=aws_instance.test-linux-vm
terraform state show aws_instance.test-linux-vm
```