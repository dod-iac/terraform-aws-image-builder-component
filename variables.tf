variable "data" {
  type        = string
  description = "Inline YAML string with data of the component. Exactly one of data and uri can be specified."
  default     = ""
}

variable "description" {
  type        = string
  description = "The description of the component."
  default     = "An component for EC2 Image Builder."
}

variable "name" {
  type        = string
  description = "The name of the component."
}

variable "platform" {
  type        = string
  description = "The platform of the component."
}

variable "tags" {
  type        = map(string)
  description = "The tags applied to the component."
  default     = {}
}

variable "uri" {
  type        = string
  description = "S3 URI with data of the component. Exactly one of data and uri can be specified."
  default     = ""
}

variable "component_version" {
  type        = string
  description = "The version of the component."
  default     = "1.0.0"
}
