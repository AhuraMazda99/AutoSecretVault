var location = 'westeurope'


resource Identifier 'Microsoft.Logic/workflows@2019-05-01' = {
  name: 'mainlogicapp'
  location: location
  properties: loadJsonContent('Automationrotatesecret.json')
}
