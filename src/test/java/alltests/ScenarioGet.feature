Feature: Get
  Background:
    * url "https://reqres.in/"
    * karate.configure('ssl', { trustAll: true })

  Scenario: Send Get
    Given path "/api/users?page=1"
    When method get
    Then status 200
    * def total = response.total
    * print total