param serverName string = 'mywebserver'
param location string = resourceGroup().location

//string concatination with param + resourceGroup id
var uniqeName = '${serverName}${resourceGroup().id}'

resource appService 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: uniqeName
  location: location
  kind:'windows'
  sku:{
    name:'F1'
    tier:'Free'
  }
}

resource webApp 'Microsoft.Web/sites@2020-06-01' = {
  name: 'mywebapp${resourceGroup().id}'
  location: resourceGroup().location
  properties:{
    //dependency with appservice plan
    serverFarmId:appService.id
    httpsOnly:false
  }
  
}
