
variable "subscription_id"{
  type=string
  default= "var.ecf831bb-9d6c-410f-ba46-1a620639498b"
}

variable "client_id"{
  type=string
  default= "var.cb593eaa-b094-4dbf-b52e-316a5aa247a7"
}
variable "client_secret"{
  type=string
  default= "var.-qC8Q~sUG2_nUpZqemiRHzUbs8kU8Qu1J~Q1pbRi"
}
variable "tenant_id"{
  type=string
  default= "var.0ebdf2d5-6a77-45d3-b758-a500afb0460d"
}
variable "countNumber"{
  type=number
  default=0
}
variable "account_tier"{
  type=string
  default="Standard"
}
variable "myname"{
  type=string
}
variable "account_replication_type"{
  type=string
  default="GRS"
}
variable "access_tier"{
  type=string
  default="Cool"
}
variable "cross_tenant_replication_enabled"{
 type=bool
 default=false
}
variable "prefix"{
 type=string
 default="mcit"
}
variable "component" {
  type    = list
  default = ["bastion", "frontproxy", "db", "infra"]
}
variable "environment"{
 type=string
 default="staging"
}
