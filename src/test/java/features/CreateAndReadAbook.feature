Feature: create a book

  Background:
    Given url 'http://library2.cybertekschool.com/rest/v1'
    # declare var that will store on da library fake book from libraryDataGenerator class
    * def LibraryDataGenerator = Java.type('com.app.utils.LibraryDataGenerator')
    # point another feature file
    * def tokenFeature = call read('classpath:features/Authentication.feature')
    # assign tokenFeature to new var
    * def authToken = tokenFeature.token
    #print assigned token
    * print authToken


  Scenario: book tests
    * header x-library-token = authToken
    * def book = LibraryDataGenerator.createBook()
    * form fields book
    * path 'add_book'
    When  method post
    Then status 200
#    * print response
    * def bookId = response.book_id
    * print bookID
    * match response == { "book_id" : "#notnull", "message" : "The book has been created."}

#  Scenario: get a book info
    Given header x-library-token = authToken
    And path 'get_book_by_id', bookId
    When method get
    Then status 200
#    * print response
    * match response.name == book.name
# PATCH
    * set book
      | path   | value        |
      | id     | bookId       |
      | author | 'Adam Smith' |
    * print book
    Given header x-library-token = authToken
    * path 'update_book'
    * request book
    * method patch
    * print response
    * match response == {"message": "The book has been updated."}


#    # try to delete and verify error occur
#    Given header x-library-token = authToken
#    * path 'delete_book', bookId
#    * method delete
#    Then status 403
#    * print response
#    * def error = response.error
#    * print error


  Scenario: get all Categories
    Given header x-library-token = authToken
    When path 'get_book_categories'
    And method get
    Then status 200
#    And print response
    And  def expectedCats = read('classpath:data/Categories.json')
    * print expectedCats
    * match response == expectedCats




