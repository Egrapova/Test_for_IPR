Feature: Testing Post&Get
  Background:
    * karate.configure('ssl', { trustAll: true })

  Scenario: Send Post
    * def result = call read('classpath:alltests/ScenarioPost.feature')
    * match result.response.name == 'Ivanov A A'

  Scenario: Send Get
    * def result = call read('classpath:alltests/ScenarioGet.feature')
    * match result.response.data..name == ["cerulean","fuchsia rose","true red","aqua sky","tigerlily","blue turquoise"]

  Scenario: Send Put
    * def result = call read('classpath:alltests/ScenarioPut.feature')
    * match result.response.name == 'Ivanov I I'

  Scenario: Send Patch
    * def result = call read('classpath:alltests/ScenarioPatch.feature')
    * match result.response.name == 'Ivanov М М'

  Scenario: Send Delete
    * def result = call read('classpath:alltests/ScenarioDelete.feature')
#    * match result.response.status == 204


