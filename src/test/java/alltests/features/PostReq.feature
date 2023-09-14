Feature: Post
  Background:
    * url "https://reqres.in/"
    * karate.configure('ssl', { trustAll: true })

  Scenario: Send Post
    Given path "api/users"
    And request body
    When method post
    Then status 201
    * def userId = response.id
    * print userId