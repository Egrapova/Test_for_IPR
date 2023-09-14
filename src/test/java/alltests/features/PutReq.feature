Feature: Put
  Background:
    * url "https://reqres.in/"
    * karate.configure('ssl', { trustAll: true })

  Scenario: Send Put
    Given path "api/users/2"
    And request body
    When method put
    Then status 200
    * def updateAt1 = response.updatedAt
    * print updateAt1