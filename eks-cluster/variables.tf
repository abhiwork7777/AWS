variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
  default     = "example-eks-cluster"
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "eks-vpc"
}

variable "subnet_1_name" {
  description = "Name tag for public subnet 1"
  type        = string
  default     = "eks-public-subnet-1"
}

variable "subnet_2_name" {
  description = "Name tag for public subnet 2"
  type        = string
  default     = "eks-public-subnet-2"
}
variable "node_group_name" {
  description = "Name of the EKS Node Group"
  type        = string
  default     = "my-node-group"
}

variable "desired_size" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes in the node group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type for the nodes"
  type        = string
  default     = "t3.medium"
}

variable "region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}
