output "print"{
    value = local.servicename
}
output "secondprint"{
    value = local.forum
}

output "lengthsa"{
    value=local.lengthsa
}
output "lengthforum"{
    value=local.lengthforum
}

output "countNumber"{
    value=var.countNumber
}
output "wintersportslist"{
    value=[for sport in local.winterlistOfSports:sport]
}
/*
for 1st element in -->inside the list variable winterlistOfSports--->"icehockey"1st element
for 2nd element in -->inside the list variable winterlistOfSports--->"snowboarding" 2nd element
for 3rd element in -->inside the list variable winterlistOfSports--->"iceskating" 3rd element
*/

output "sumofthreenumbers"{
    value=sum([for numberoutput in local.total_output: tonumber(numberoutput)])
}
output "id" {
  value = [
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.id
  ]
}



output "client_key" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config.0.client_key
  ]
}

 output "client_certificate" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config.0.client_certificate
  ]
} 



output "host" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.batchabcd: cluster.kube_config.0.host
  ]
}
output "exampleoutput" {
  value =    { for character in local.characters: # Convert character list to a set
      character => local.enemies_destroyed
  }

}

output "character_enemy_output" {
  value = local.character_enemy_map
}
output "myappoutput" {
value= var.list_of_string
}

# Outputs for the VM IDs
output "vm_ids" {
  description = "The IDs of the created VMs"
  value       = { for name, vm in azurerm_linux_virtual_machine.example_vm : name => vm.id }
}
