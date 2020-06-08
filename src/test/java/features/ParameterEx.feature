Feature: parameter examples


  Scenario: path parameter one
    Given url 'https://api.exchangeratesapi.io'
    And  path 'latest'
    When method GET
    Then status 200
    And  match header Content-Type == 'application/json'

    # we can path value directly to path and validate

  Scenario: path parameter two
    Given  url 'https://api.exchangeratesapi.io'
    And   path '2020-06-01'
    When  method get
    Then  status 200
    And match header Content-Type == 'application/json'


  Scenario: 2 path params
    Given url 'http://api.cybertektraining.com'
    And  path 'teacher' , 'all'
    When method get
    Then status 200

  Scenario: query parameter
    Given url 'https://cybertek-ui-names.herokuapp.com/api'
    And param region = 'Germany'
    When method get
    Then status 200
    And match response.region == 'Germany'

#  @fight
  Scenario: query 2 parameters
    Given url 'https://cybertek-ui-names.herokuapp.com/api'
    And param region = 'Romania'
    And param amount = 2
    When method get
    Then status 200
    And print response
    And def len = response.length
    And match len == 2
    And match each response contains {"region": "Romania"}


  Scenario: query params stuff
    Given url 'https://cybertek-ui-names.herokuapp.com/api'
    And def count = 5
    And param amount = count
    When method get
    Then status 200
    And def actualCount = response.length
    And match count == actualCount

  Scenario: form params ex
    Given url 'http://library2.cybertekschool.com/rest/v1'
    And path 'login'
    And form field email = 'student32@library'
    And form field password = 'GYLemAba'
    When method post
    Then status 200
    And print response
    And match response.token == '#notnull'
    And match response.token == '#present'


  Scenario: form params ex
    Given url 'http://library2.cybertekschool.com/rest/v1'
    And path 'login'
    And def credential = {'email' : 'student32@library', 'password' :'GYLemAba'}
    And form fields credential
    When method post
    Then status 200
    * match response.token == '#notnull'



