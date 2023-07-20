

variable "vpc_cidr" {
  default = "10.0.0.0/24"
}

variable "first-subnet-cidr" {
  default = "10.0.0.0/25"
}
variable "second-subnet-cidr" {
    default = "10.0.0.128/25"
  
}

variable "avavilability_zone" {
    default = "us-east-1a"
  
}

variable "route" {
    default = "0.0.0.0/0"
  
}