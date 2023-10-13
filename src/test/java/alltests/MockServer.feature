Feature: First Mock Server
Scenario:  pathMatches('/testmock') && methodIs('post') && request.field1 == 'one'
  * def response = {"status": "success"}
  * def responseHeaders = {"Content-type": "application/json"}
  * def responseStatus = 200
  * def resposeDelay = 0