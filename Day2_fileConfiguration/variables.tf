variable "ami_id" {
    default = ""
    type = string
    description = "Passing value from AMI id"
}

variable "instance_type"{
    default = ""
    type = string
    description = "Passing the type of instance"
}

variable "subnet_id" {
    default = ""
    type = string
    description = "Passing the subnet id"
}
