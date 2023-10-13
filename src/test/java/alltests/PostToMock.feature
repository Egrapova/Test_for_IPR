Feature: Send Post to Mock
Background:
  * karate.start({ mock: 'MockServer.feature', port: 8088 })
Scenario: Test
  Given url "http://localhost:8088/testmock"
  And request {"field1":"one"}
  Then method post
  Then match response.status == 'success'

