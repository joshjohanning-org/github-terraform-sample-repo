variable "app_id" {
  description = "GitHub App ID"
  default     = "390793"
}

variable "app_pem_file" {
  description = "GitHub App private key"
  default     = "./josh-terraform-app.2023-09-15.private-key.pem"
}

variable "app_installation_id_joshjohanning-org" {
  description = "GitHub App installation ID"
  default     = "41851701"
}

variable "app_installation_id_joshjohanning-workflows" {
  description = "GitHub App installation ID"
  default     = "41851711"
}
