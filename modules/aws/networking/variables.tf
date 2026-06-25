variable "vpc_cidr" {
  type        = string
  description = "The base IP range for your isolated cloud network"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public-facing entry subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for backend workloads"
}

variable "availability_zones" {
  type        = list(string)
  description = "Target AWS availability zones for high-availability mapping"
}
