### ... Start of File ...

terraform {
    required_providers {
        aws = {
        source = "hashicorp/aws"
    version = "~> 3.27"
        }
    }
}

provider "aws" {
    profile = "default"
    region = "us-west-2"
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
    Name = "main"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id

tags = {
    Name = "main-gw"
    }
}
### ... continued on the next page ...

### ... continued from the previous page ...

resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-west-2a"
    tags = {
        Name = "private-subnet-1"
    }
}

resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-west-2b"
tags = {
    Name = "private-subnet-2"
    }
}

variable "subnet_ids" {
type = list(string)
default = ["aws_subnet.private-subnet-1.id",
"aws_subnet.private-subnet-2.id"]
}

locals {
subs = concat([aws_subnet.private-subnet-1.id],
[aws_subnet.private-subnet-2.id])
}

resource "aws_instance" "web" {
count = 4
ami = "ami-830c94e3"
instance_type = "t2.micro"
subnet_id = element(local.subs, count.index)
}
### ... continued on the next page ...

### ... continued from the previous page ...

# Create a new loadbalancers
resource "aws_elb" "my_elb" {
    name = "my-terraform-elb"
    availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

listener {
    instance_port = 8000
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
}

listener {
    instance_port = 8000
    instance_protocol = "http"
    lb_port = 8080
    lb_protocol = "http"
}

health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:8000/"
    interval = 30
}

cross_zone_load_balancing = true
idle_timeout = 400
connection_draining = true
connection_draining_timeout = 400
tags = {
    Name = "my-terraform-elb"   
    }
}

### ... End of File ...

