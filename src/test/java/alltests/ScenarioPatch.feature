Feature: Patch
  Background:
    * url "https://reqres.in/"
    * karate.configure('ssl', { trustAll: true })

  Scenario: Send Patch
    * def body = read('classpath:alltests/json/updateUser2.json')

    Given path "api/users/2"
    And request body
    When method patch
    Then status 200
    * def updateAt2 = response.updatedAt
    * print updateAt2