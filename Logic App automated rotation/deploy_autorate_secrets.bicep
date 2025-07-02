var location = 'westeurope'
var logicappname = 'rotate secrets'


resource Rotate_secrets 'Microsoft.Logic/workflows@2019-05-01' = {
  name: logicappname
  tags: {
    placeholder: 'test'
  }
  location: location
  properties: loadJsonContent('Automation_rotate_secret.json')
}
