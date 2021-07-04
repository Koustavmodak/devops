
resource mystorage 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: 'bicepstorageaccount${resourceGroup().id}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
    tier:'Standard'
  }
  kind: 'StorageV2'
  properties:{
    accessTier:'Hot'
  }
}
