targetScope = 'subscription'

param rgName string
param location string = 'eastus'
param keyVaultName string
param skuName string = 'standard'

resource keyVaultRg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgName
  location: location
}

module keyVaultModule './keyvault/main.bicep' = {
  name: 'keyVaultDeployment'
  scope: resourceGroup(keyVaultRg.name)
  params: {
    keyVaultName: keyVaultName
    location: location
    skuName: skuName
  }
}
