Feature: Functionality of the data_magic gem
  
  Background:
    Given I have read the yaml file from features/yaml
    When I ask for the data for "dm"

  Scenario: Getting basic data from the yaml
    Then the value for "value1" should be "this is value 1"
    And the value for "value2" should be "this is value 2"

  Scenario: Getting names from the yaml
    Then the value for "full_name" should have a minimum of 2 words
    And the value for "first_name" should be 1 word long
    And the value for "last_name" should be 1 word long
    And the value for "name_prefix" should be 1 word long
    And the value for "name_suffix" should be 1 word long
    And the value for "title" should have a minimum of 3 words

  Scenario: Getting addresses from the yaml
    Then the value for "street" should have a minimum of 2 words
    And the value for "street_plus" should have a minimum of 4 words
    And the value for "city" should have a minimum of 1 word
    And the value for "state" should have a minimum of 1 word
    And the value for "state_ab" should be 1 word long
    And the value for "zip" should be 1 word long
    And the value for "country" should have a minimum of 1 word
    And the value for "second_address" should have a minimum of 1 words

  Scenario: Getting a company name from the yaml
    Then the value for "company" should have a minimum of 1 word

  Scenario: Getting an email address from the yaml
    Then the value for "email" should be 1 word long
    And the value for "email_plus" should include "buddy"
    And the value for "domain_name" should be 1 word long
    And the value for "user_name" should be 1 word long

  Scenario: Getting a phone number
    Then the value for "phone" should have a minimum of 1 word

  Scenario: Random phrases
    Then the value for "catch_phrase" should exist
    And the value for "words" should exist
    And the value for "sentence" should exist
    And the value for "sentences" should exist
    And the value for "paragraphs" should exist
    And the value for "characters" should be 255 characters long

  Scenario: Boolean values
    Then the value for "bool_true" should be true
    And the value for "bool_false" should be false

  Scenario: Reading multiple data segments
    When I ask for the data for "other"
    Then the value for "name" should be "Cheezy"
    And the value for "address" should be "123 Main Street"
    And the value for "email" should be "cheezy@example.com"

  Scenario: Reading from multiple yml files
    When I load the file "another.yml"
    And I ask for the data for "other_file"
    Then the value for "name" should be "Sneezy"
    And the value for "address" should be "555 Easy Money Drive"
    And the value for "email" should be "sneezy@example.com"

  Scenario: Reading multiple entries from same file
    When I load the file "another.yml"
    And I ask for the data for "other_file"
    Then the value for "name" should be "Sneezy"
    When I ask for the data for "more_info"
    Then the value for "name" should be "Wheezy"
    And the value for "address" should be "999 Alergy Ave"
    And the value for "email" should be "wheezy@example.com"

  Scenario: Returning a randomly selected value from an array
    Then the value for "random" should be either "Tom", "Dick", or "Harry"
    And the value for "range" should be between 1 and 5

  Scenario: Returning a value based on a mask
    Then the value for "mask" should begin with 3 numbers
    And the value for "mask" should have 3 upper case letters after a dash
    And the value for "mask" should end with 3 lower case letters
