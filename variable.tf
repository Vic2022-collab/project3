variable "region_name" {
 type        = string
 description = "name of region"
 default     = "eu-west-2"
}


variable "vpc_cidr" {
 type        = string
 description = "name of vpc cidr"
 default     = "10.0.0.0/16"
}

variable "sub1_cidr" {
 type        = string
 description = "name of sub1_cidr"
 default     = "10.0.1.0/24"
}


variable "az2" {
 type        = string
 description = "name of az2"
 default     = "eu-west-2b"
}

variable "sub2_cidr" {
 type        = string
 description = "name of sub2_cidr"
 default     = "10.0.2.0/24"
}


variable "az1" {
 type        = string
 description = "name of az1"
 default     = "eu-west-2a"
}


variable "priv1_cidr" {
 type        = string
 description = "name of priv1_cidr"
 default     = "10.0.3.0/24"
}


variable "priv2_cidr" {
 type        = string
 description = "name of priv2_cidr"
 default     = "10.0.4.0/24"
}

variable "server1-ami-id" {
  type        = string
  description = "name of sever1 ami id"
  default     = "ami-0758d98b134137d18"
}

variable "server2-ami-id" {
    type             = string
    description      = "name of server2 ami"
    default          = "ami-0758d98b134137d18"
}   



variable "instance-type-server1" {
  type          = string 
  description   = "name of instance type server1"
  default       = "t2.micro"
}

variable "instance-type-server2" {
    type         = string 
    description  = "name of instance type server2"
    default      = "t2.micro"
}    

variable "aws_instance" {
   type          = string
   description   = "name of instance"
   default       = "terraform-server1"
}

variable "aws_instance2" {
     type              = string
     description       = "name of instance2"
     default           = "terraform-server2"
}

variable "server1-key-name" {
  type        = string
  description = "server1 key name"
  default     = "project3"

} 

variable "server2-key-name" {
  type        = string
  description = "server2 key name"
  default     = "project3"
} 







