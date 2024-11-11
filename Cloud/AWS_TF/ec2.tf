# # Create an EC2 instance
# resource "aws_instance" "test-linux-vm" {
#   count                  = 3
#   ami                    = "ami-06b21ccaeff8cd686" # Amazon Linux 2 AMI
#   instance_type          = "t2.micro"
#   subnet_id              = aws_subnet.main.id
#   vpc_security_group_ids = [aws_security_group.allow_ssh.id]

#   tags = merge(local.tags,
#     { Name = "test-vm-${count.index + 1}" }
#   )
# }



# Create EC2 instances for each evironment configuration.
# resource "aws_instance" "test-linux-vm" {
#   for_each               = var.environment_configurations
#   ami                    = each.value.ami
#   instance_type          = each.value.instance_type
#   subnet_id              = aws_subnet.main.id
#   vpc_security_group_ids = [aws_security_group.allow_ssh.id]

# tags = merge(local.tags,
#   {
#     Name = "test-vm-${each.key}"
#   },
#   each.value.tags
# )
# }

# -------------------------------------------------------------------------------------------

locals {
  instance_configs = flatten([
    for env, config in var.environment_configurations : [
      for i in range(config.count) : {
        env    = env
        config = config
        index  = i
      }
    ]
  ])
}

resource "aws_instance" "test-linux-vm" {
  for_each               = { for instance in local.instance_configs : "${instance.env}-${instance.index}" => instance }
  ami                    = each.value.config.ami
  instance_type          = each.value.config.instance_type
  subnet_id              = each.value.config.subnet_id
  vpc_security_group_ids = each.value.config.vpc_security_group_ids

  tags = merge(local.tags,
    {
      Name = "${each.value.env}-instance-${each.value.index + 1}"
    },
  )
}

