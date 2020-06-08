Feature: : Welcome to karate

  Scenario: some printing
    Given  print "hello from given"
    When  print 'this from when'
    Then  print 'goodbye then'

  Scenario: more printing
    * print 'i print more stuff'
    * print 'my name is','cucumber'
    * print '1+1'


      # using def keyword
  Scenario: variables
    * def name = 'sub-zero'
    * print 'my name' = 2
    * def medalCount = 2
    * print name, 'has', medalCount, 'medals'
    * print name, 'has', medalCount*2, 'medals'


  Scenario: more difficult parameters
    * def student = {'name' : 'sam', 'owes_tuition': 'false'}
    * print student
    * print student.name
    * print student.owes_tuition


  Scenario: more difficult parameters: json object 2
    * def student =
      """
      {
      "name" : "Ozgur(Ozzy)" ,
      "isAwesome" : "Absolutely yes"
      }
      """
    * print student
    * print student.name
    * print student.isAwesome


  Scenario: more difficult parameters: json array objects
    * def students =
    """
    [
      {
          'name': 'Ferus',
          'isAwesome': 'yes of course'
      },
      {
         'name': 'Arman',
          'isAwesome': 'yes of course'
      }
    ]
    """
    * print students
    * print students[0].name
    * print students[1].name