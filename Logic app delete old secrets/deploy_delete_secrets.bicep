var location = 'westeurope'

resource delte_old_secrets 'Microsoft.Logic/workflows@2019-05-01' = {
  name: 'placeholder'
  tags: {
    placeholder: 'placeholder'
  }
  location: location
  properties: loadJsonContent('Automation_delete_secret.json')
}
