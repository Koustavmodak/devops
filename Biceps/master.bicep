// As the targetscope for this deployment is subscription then we can 
// deploye a resource group in this scope. if target scope is resource group 
// then only other resources can be deployed which are grouped into RG
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01'={
  name:'bicep-rg'
  location:'eastus'
}

module storage 'storage-account.bicep' = {
  scope:rg
  name: 'storageDeplyment'
}
module webapp 'appservice.bicep' = {
  scope: rg
  name: 'webappDeploment'
  params: {
    serverName: 'mywebserver'
  }
  
}
