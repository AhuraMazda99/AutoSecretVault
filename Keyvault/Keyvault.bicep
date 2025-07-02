var location = 'westeurope'
param object_id string 

resource Keyvaultstoresecrets 'Microsoft.KeyVault/vaults@2024-12-01-preview' = {
  name: 'placeholder'
  location: location
  properties: {
    sku: {
      name:  'standard'
      family: 'A'
    }
    tenantId: '5a5d7aa1-ca58-4db9-9872-ad0de107692b'
    accessPolicies: [
       {
        objectId: object_id
        permissions: {
          secrets: [
             'all'
          ]
        }
        tenantId: '5a5d7aa1-ca58-4db9-9872-ad0de107692b'
       }
    ]
  }
}

