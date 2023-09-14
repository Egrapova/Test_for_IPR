Feature: Delete
  Background:
    * url "https://reqres.in/"
    * karate.configure('ssl', { trustAll: true })

  Scenario: Send Delete
    Given path "api/users/2"
    When method delete
    Then status 204