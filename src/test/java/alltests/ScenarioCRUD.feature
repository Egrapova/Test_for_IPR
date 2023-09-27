Feature: Testing Post&Get

  Scenario Outline: Create User Outline <name1>
    * def body = read('classpath:alltests/json/createUserOutline.json')
    * def result = call read('classpath:alltests/features/PostReq.feature')
    * print result.response
    * match result.response == { createdAt: '#string', name: '#(name1)', id: '#string', job: '#(job1)'}
    * match result.responseStatus == 201
    * assert result.responseStatus >= 200

    Examples:
      | name1         | job1    |
      | Bob Dylan     | singer  |
      | Nyan Cat      | cat     |
      | Jamie Oliver  | cook    |
      | Keanu Reeves  | actor   |

  Scenario: Send Post
    * def bodyReq = read('classpath:alltests/json/createUser.json')
    * def result = call read('classpath:alltests/features/PostReq.feature') {'body':'#(bodyReq)'}
    * match result.response.name == 'Ivanov A A'
    * print result

  Scenario: Send Get
    * def result = call read('classpath:alltests/features/GetReq.feature')
    * match result.response.data..name == ["cerulean","fuchsia rose","true red","aqua sky","tigerlily","blue turquoise"]

  Scenario: Send Put
    * def bodyReq = read('classpath:alltests/json/updateUser1.json')
    * def result = call read('classpath:alltests/features/PutReq.feature') {'body':'#(bodyReq)'}
    * match result.response.name == 'Ivanov I I'

  Scenario: Send Patch
    * def bodyReq = read('classpath:alltests/json/updateUser2.json')
    * def result = call read('classpath:alltests/features/PatchReq.feature') {'body':'#(bodyReq)'}
    * match result.response.name == 'Ivanov М М'

  Scenario: Send Delete
    * def result = call read('classpath:alltests/features/DeleteReq.feature')
    * match result.responseStatus == 204


