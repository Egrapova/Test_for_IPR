Feature: Testing Post&Get
  Background:
    * url "https://reqres.in/"
    * karate.configure('ssl', { trustAll: true })

  Scenario: Send Post
   * def body = read('classpath:alltests/createUser.json')

    Given path "api/users"
    And request body
    When method post
    Then status 201
    * def userId = response.id
    * print userId


  Scenario: Send Get
    Given path "/api/users?page=1"
    When method get
    Then status 200
    * def total = response.total
    * print total

  Scenario: Send Put
    * def body = read('classpath:alltests/updateUser1.json')

    Given path "api/users/2"
    And request body
    When method put
    Then status 200
    * def updateAt1 = response.updatedAt
    * print updateAt1

  Scenario: Send Patch
    * def body = read('classpath:alltests/updateUser2.json')

    Given path "api/users/2"
    And request body
    When method patch
    Then status 200
    * def updateAt2 = response.updatedAt
    * print updateAt2

  Scenario: Send Delete
    
    Given path "api/users/2"
    When method delete
    Then status 204


