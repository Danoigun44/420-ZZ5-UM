# Output for VMs
output "vm_ids" {
  description = "The IDs of the VMs"
  value       = { for vm in azurerm_linux_virtual_machine.exrgrp_vm : vm.name => vm.id }
}

# Output for WAF Policies
output "waf_policy_ids" {
  description = "The IDs of the WAF policies"
  value       = { for waf in azurerm_web_application_firewall_policy.exrgrp_waf : waf.name => waf.id }
