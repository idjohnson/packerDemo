//  variables.pkr.hcl

// For those variables that you don't provide a default for, you must
// set them from the command line, a var-file, or the environment.

variable "client_secret" {
  type =  string
  default = "insertyoursecrethereforthesp"
  // Sensitive vars are hidden from output as of Packer v1.6.5
  sensitive = false
}

variable "client_id" {
  type =  string
  default = "d2390854-6661-451d-bee2-3bd9b42b14cc"
  // Sensitive vars are hidden from output as of Packer v1.6.5
  sensitive = false
}

variable "tenant_id" {
  type = string
  default = "0040020a-b598-444c-8f0b-92f82e1224c0"
}

variable "subscription_id" {
  type = string
  default = "944c019d-3e46-422b-b63a-86513f147562"
}


