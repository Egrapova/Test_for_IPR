Feature: Post
  Background:
    * url someUrlBase

  Scenario: Send Post
    Given path "api/users"
    And request body
    When method post
    Then status 201
    * def userId = response.id
    * print userId