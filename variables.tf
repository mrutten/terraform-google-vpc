variable "project_id" {
  description = "The ID of the project where this VPC will be created."
  type        = string
}

variable "network_name" {
  description = "The name of the network being created."
  type        = string
}

variable "routing_mode" {
  description = "The network routing mode."
  type        = string
  default     = "GLOBAL"
}

variable "shared_vpc_host" {
  description = "Makes this project a Shared VPC host if 'true'."
  type        = bool
  default     = false
}

variable "description" {
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  type        = string
  default     = ""
}

variable "auto_create_subnetworks" {
  description = <<-EOF
    When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. 
    When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources.
  EOF
  type        = bool
  default     = false
}

variable "delete_default_internet_gateway_routes" {
  description = <<-EOF
    If set, ensure that all routes within the network specified whose names begin 
    with 'default-route' and with a next hop of 'default-internet-gateway' are deleted.
  EOF
  type        = bool
  default     = false
}

variable "mtu" {
  description = <<-EOF
    The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). 
    Recommended values: 1460 (default for historic reasons), 1500 (Internet default), 
    or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively.
  EOF
  type        = number
  default     = 0
}

variable "enable_ipv6_ula" {
  description = "Enabled IPv6 ULA, this is a permenant change and cannot be undone!"
  type        = bool
  default     = false
}

variable "internal_ipv6_range" {
  description = "When enabling IPv6 ULA, optionally, specify a /48 from fd20::/20."
  type        = string
  default     = null
}

variable "network_firewall_policy_enforcement_order" {
  description = <<-EOF
    Set the order that Firewall Rules and Firewall Policies are evaluated. 
    Valid values are `BEFORE_CLASSIC_FIREWALL` and `AFTER_CLASSIC_FIREWALL`.
  EOF
  type        = string
  default     = null
}
