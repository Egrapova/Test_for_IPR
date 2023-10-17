Feature: Send Post to Mock
Background:
  * def server = karate.start({ mock: 'MockServer.feature', port: 8088 })
Scenario: Test
  Given url "http://localhost:8088/testmock"
  And request {"field1":"one1"}
  Then method post
  Then match response.status == 'success'
  * server.stop()