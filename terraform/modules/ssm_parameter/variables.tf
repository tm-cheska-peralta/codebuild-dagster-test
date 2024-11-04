variable "parameters" {
  type = map(object({
    value = string
    type  = string
  }))
}
