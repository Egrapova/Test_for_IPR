Feature: Read Different Files

Scenario: Read Files
* def txtfile = read('classpath:alltests/txt/File.txt')
* def jsonfile = read('classpath:alltests/json/File.json')
* def First = jsonfile.Control.Point.First
* def Second = jsonfile.Control.Point.Second
* def Third = jsonfile.Control.Point.Third
* def xmlfile = read('classpath:alltests/xml/File.xml')
* print "Вывод данных из txt файла " + txtfile
* print 'Вывод значений из json ' + '1.' + First + '; 2.' + Second + '; 3.' + Third + '.'
* print 'Вывод значений из xml ' + xmlfile
Scenario: преобразование в string
* string json_to_string = read('classpath:alltests/json/File.json')
* print json_to_string
* string xml_to_string = read('classpath:src/test/java/alltests/xml/File.xml')
* print xml_to_string
Scenario: преобразование в json
* json txt_to_json = read('classpath:alltests/txt/File_json.txt')
* print txt_to_json
* json xml_to_json = read('classpath:alltests/xml/File.xml')
* print xml_to_json
Scenario: преобразование в xml
* xml txt_to_xml = read('classpath:alltests/txt/File_xml.txt')
* print txt_to_xml
* xml json_to_xml = read('classpath:alltests/json/File.json')
* print json_to_xml
Scenario: преобразование в xmlstring
* xmlstring txt_to_xml = read('classpath:alltests/txt/File_xml.txt')
* print "txt" txt_to_xml
* xmlstring json_to_xml = read('classpath:alltests/json/File.json')
* print json_to_xml
* xmlstring xml_to_xmlstring = read('classpath:alltests/xml/File.xml')
* print xml_to_xmlstring