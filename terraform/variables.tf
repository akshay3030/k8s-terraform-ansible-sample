variable control_cidr {
  description = "CIDR for maintenance: inbound traffic will be allowed from this IPs"
  #default = "209.220.148.28/32" non-home
  default = "67.180.52.27/32"
}

variable default_keypair_public_key {
  description = "Public Key of the default keypair"
  #default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJRUrQqfbbJJj7TRajI+3L24Um7xlHMjh7wmxg0jQq4S5OyjkbMftPNYdMCPvHSqDVI9PRVhgMuAy6ctbRL3A3SGIwA6XlevOo3ps5q3Jl7DauyQlv7ABrCHj/eBFKbIJeHXuzj9gMGPsbkgv7GHPDCC5CY0rVlik2RqwoHTir/l46x4EYpNZUBqJ2iHzv/MCDnBZpXd3IlWbnzecOR5LKsNNWtwgEbjJnO64urwANA+AXSH/Ei4nkf2QC7j5vLkrS0bEGv0DPclWZWT9VP5Q8axUP/FJHpjMdyeyQ4IISHRc6gWE7a18CMMntqCAXMVn6ZXT9acUkSRWD0DR4BnId akumar5@OSXAKUMA5MBP15.local"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYSYumRQDQ3mH8IsH6G8UUxQdAoZ7tqfGsoNIKnz263sGHMrJ0cX8ohhx5QzlDSN+PuH5QUhRZuWsoMNGCdDkZCQISKX9PgFOXpQLmc8voVt/GfVoCUzB/Oc0BmOSBy5G7tXLVXIO+XhGu2/9BuAITI1+rZiv2vkBLQJTH/Do1BKYMyu3lBfKTfnfjwlYYVZrsga/OU67YX1mJ33l402oWHG9+0GByTo5JAWp2WjLHyXiMwiSDnXr7xLCigw85iPxmPntGH5Mr/3CVsfnTC3TKeZkzOGKOEuFEBfBQkWIdEKPEd1fmOQ+rQf4kyGA6UTMZIDB6ImFCocrn7ewKvgBZWABnyQnIFP7/0pHm9OcWyG8X7+gCcwhEVAP6yfIdIn9xPCblqjTXBkJdOnd2VXWtqjX73XaNRck8girRlCffOhzocRhzK50+K3nxS28fcPqlyim5FXYlnOellay1GMfecXCVLc95Jumwu4X5l82yOfb8d5tZ3pUoPZB7yxlMN7nK/jzHrPm5u2CVgn8WO9VfJn30cJ1NNilsQSKbuu4eEJtybChCb6u2WBQvD5UXPzVwNGawaF2Q7SChikQ8WE6JbiK1jPmZpVxDBweXhXK/NhOYjcLIbaJRcykof8vjhvkBwPdYDSS/9oIuqnfM1PgS8tucT73tICUOMvU0fWIKkw== akumar5@osxakuma5mbp15.corp.elmae"
}

variable default_keypair_name {
  description = "Name of the KeyPair used for all nodes"
  default = "emk8"
}


variable vpc_name {
  description = "Name of the VPC"
  default = "kubernetes"
}

variable elb_name {
  description = "Name of the ELB for Kubernetes API"
  default = "kubernetes"
}

variable owner {
  default = "Kubernetes"
}

variable ansibleFilter {
  description = "`ansibleFilter` tag value added to all instances, to enable instance filtering in Ansible dynamic inventory"
  default = "Kubernetes01" # IF YOU CHANGE THIS YOU HAVE TO CHANGE instance_filters = tag:ansibleFilter=Kubernetes01 in ./ansible/hosts/ec2.ini
}

# Networking setup
variable region {
  default = "us-west-2"
}

variable zone {
  default = "us-west-2a"
}

### VARIABLES BELOW MUST NOT BE CHANGED ###

variable vpc_cidr {
  default = "10.43.0.0/16"
}

variable kubernetes_pod_cidr {
  default = "10.200.0.0/16"
}


# Instances Setup
variable amis {
  description = "Default AMIs to use for nodes depending on the region"
  type = "map"
  default = {
    ap-northeast-1 = "ami-0567c164"
    ap-southeast-1 = "ami-a1288ec2"
    cn-north-1 = "ami-d9f226b4"
    eu-central-1 = "ami-8504fdea"
    eu-west-1 = "ami-0d77397e"
    sa-east-1 = "ami-e93da085"
    us-east-1 = "ami-40d28157"
    #us-west-1 = "ami-6e165d0e"
    us-west-1 = "ami-8d948ced"
    #us-west-2 = "ami-a9d276c9"
    us-west-2 = "ami-db710fa3"
  }
}
variable default_instance_user {
  default = "ubuntu"
}

variable etcd_instance_type {
  default = "t2.small"
}
variable controller_instance_type {
  default = "t2.small"
}
variable worker_instance_type {
  default = "t2.small"
}


variable kubernetes_cluster_dns {
  default = "10.31.0.1"
}
