Feature: Delete
  Background:
    * url someUrlBase

  Scenario: Send Delete
    Given path "api/users/2"
    When method delete
    Then status 204