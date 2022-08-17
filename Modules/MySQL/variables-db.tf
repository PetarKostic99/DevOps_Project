variable "allocated-storage" {
  type    = number
  default = 10
}



variable "username" {
  type = string
}
variable "storage-type" {
  type    = string
  default = "gp2"
}
variable "engine" {
  type    = string
  default = "mysql"
}
variable "engine-version" {
  type    = string
  default = "8.0.28"
}
variable "instance-class" {
  type    = string
  default = "db.t3.micro"
}
variable "db-name" {
  type = string
}
variable "identifier" {
  type = string
}
variable "password" {
  type = string
}
variable "db-subnet-group-name" {
  type = string
}
variable "vpc-security-group-ids" {
  type    = list(string)
  default = []
}



variable "apply-immediately" {
  type    = bool
  default = false
}
variable "publicly-accessible" {
  type = bool
}
variable "skip-final-snapshot" {
  type    = bool
  default = true
}


