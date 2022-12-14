variable "region" {
  description = "Default region to deploy"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["22", "80", "443"]
}

variable "instance_type" {
  description = "Intance type"
  type        = string
  default     = "t2.medium"
}

variable "jenkins_backup_revision" {
  description = "Backup file name"
  type        = string
  default     = "backup.tar.gz"
}
