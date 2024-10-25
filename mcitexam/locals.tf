/*# Define the names of the VMs and WAF policies
locals {
  vms        = ["mcitexamvm1", "mcitexamvm2", "mcitexamvm3", "mcitexamvm4", "mcitexamvm5"]
  waf_policies = {
    "mcitwaf1" = "mcitexamvm1"
    "mcitwaf2" = "mcitexamvm2"
    "mcitwaf3" = "mcitexamvm3"
    "mcitwaf4" = "mcitexamvm4"
    "mcitwaf5" = "mcitexamvm5"
  }
}
*/
