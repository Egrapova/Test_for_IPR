Feature: Get
  Background:
    * url someUrlBase

  Scenario: Send Get
    Given path "/api/users?page=1"
    When method get
    Then status 200
    * def total = response.total
    * print total