Feature: Testing Post&Get
  Background:
    * url "https://reqres.in/"
    * karate.configure('ssl', { trustAll: true })
  Scenario: Send Post&Get
    * def createUser =
    """
      {
        "name": "Ivanov A A",
        "job": "Director"
      }
    """

    * def updateUser1 =
    """
      {
        "name": "Ivanov I I",
        "job": "Deputy of director"
      }
    """

    * def updateUser2 =
    """
      {
        "name": "Ivanov I I",
        "job": "Former director"
      }
    """

    Given path "api/users"
    And request createUser
    When method post
    Then status 201
    * def userId = response.id
    * print userId

    Given path "/api/users?page=1"
    When method get
    Then status 200
    * def total = response.total
    * print total
    
    Given path "api/users/2"
    And request updateUser1
    When method put
    Then status 200
    * def updateAt1 = response.updatedAt
    * print updateAt1

    Given path "api/users/2"
    And request updateUser2
    When method patch
    Then status 200
    * def updateAt2 = response.updatedAt
    * print updateAt2
    
    Given path "api/users/2"
    When method delete
    Then status 204


