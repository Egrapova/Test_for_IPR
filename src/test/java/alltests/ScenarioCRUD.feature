Feature: Testing Post&Get
  Scenario: Read Files
    * def txtfile = read('classpath:alltests/txt/readTxtFile.txt')
    * def jsonfile = read('classpath:alltests/json/readJsonFile.json')
    * def First = jsonfile.Control.Point.First
    * def Second = jsonfile.Control.Point.Second
    * def Third = jsonfile.Control.Point.Third
    * def xmlfile = read('classpath:alltests/xml/readXmlFile.xml')
    * print txtfile + ': 1.' + First + '; 2.' + Second + '; 3.' + Third + '.'
    * print xmlfile
#    преобразование в string
    * string json_to_string = read('classpath:alltests/json/readJsonFile.json')
    * print json_to_string
    * string xml_to_string = read('classpath:alltests/xml/readXmlFile.xml')
    * print xml_to_string#    преобразование в string
#    преобразование в json
    * json txt_to_json = read('classpath:alltests/txt/readTxtFile_json.txt')
    * print txt_to_json
    * json xml_to_json = read('classpath:alltests/xml/readXmlFile.xml')
    * print xml_to_json
#    преобразование в xml
    * xml txt_to_xml = read('classpath:alltests/txt/readTxtFile_xml.txt')
    * print txt_to_xml
    * xml json_to_xml = read('classpath:alltests/json/readJsonFile.json')
    * print json_to_xml
#    преобразование в xmlstring
    * xmlstring txt_to_xml = read('classpath:alltests/txt/readTxtFile_xml.txt')
    * print txt_to_xml
    * xmlstring json_to_xml = read('classpath:alltests/json/readJsonFile.json')
    * print json_to_xml

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


