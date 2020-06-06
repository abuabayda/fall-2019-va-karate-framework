Feature: exchange rates api tests


  Scenario: basic test with status code validation
    Given url 'https://api.exchangeratesapi.io/latest'
    When method get
    When match header Content-Type == 'application/json'
    And match header Connection == 'keep-alive'

    #match --> method to do verifications
    # == for validation
   # = for setting value

  Scenario: array value matching
    * def fighters =
  """
  [
    {
      "name": "scorpion",
      "medals": 25
    },
    {
      "name": "Milena",
      "medals": 26
    }
  ]
  """
    * def length = fighters.length
    * match length == 2
    * match fighters[0].name == '#string'
    * match fighters contains {"name": "scorpion", "medals": 25}
    