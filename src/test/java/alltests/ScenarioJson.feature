Feature: Work with Json
  Scenario: Replace
#    Создать сценарий по замене значений параметров в json, вывести полученный json на экран
    * def myJson = read('classpath:alltests/json/PGA_Frod.json')
#    Ключевое слово "Eval" можно опустить для сокращения кода
    * myJson.version = 555
    * eval myJson.event.provider.orgName = '!!!  NewName   !!!'
#    Использование слова Set
    * set myJson.event.card.3ds.device.browserAcceptHeader = '!!!  NewHeader   !!!'
    * set myJson.event.card.3ds.device.browserUserAgent = "!!!   NewUserAgent   !!!"
#    Изменение тектового поля в массив
    * set myJson.event.channel[0] = 111
    * set myJson.event.channel[1] = 222
    * set myJson.event.channel[] = 333
    * set myJson.event.channel[3] = 444
    * print myJson

  Scenario: Add
#    Создать сценарий с добавлением нового параметра в json, вывести полученный json на экран
    * def myJson = read('classpath:alltests/json/PGA_Frod.json')
#    Ключевое слово "Eval" можно использовать для добавления новых параметров. его можно не писать
    * myJson.NewField = { text1: 'symbol1', text2: 'symbol2'}
    * myJson.NewField.text3 = "symbol3"
    * set myJson.NewField.text4 = 'symbol4'
    * eval myJson.NewField.text5 = "symbol5"
#    Добавим массив
    * set myJson.array[0,1,2,3] = [111,222,333,444]
    * set myJson.array[] = 555
#    Добавим json внутрь
    * set myJson.add.inner.json = {new: 'inner', you see: 'yes'}
    * print myJson

  Scenario: Delete
#        Создать сценарий с удалением параметра в json, вывести полученный json на экран
    * def myJson = read('classpath:alltests/json/PGA_Frod.json')
    * set myJson.array[0,1,2,3] = [111,222,333,444]
#    Удаление параметра
    * remove myJson.event.card.3ds
#    Удаление элемента массива
    * remove myJson.array[1]
#    Удаление параметра с помощью слова eval delete
    * eval delete myJson.event.transactionData
    * eval delete myJson.ext[1]
    * print myJson
