# CaC_Basics_POC
Configuration as Code basics for presentations and POCs

### Ansible Best Practices

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