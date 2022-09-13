Feature: Creator selects Resource type Artistic Result and subtype Performing arts

  @TEST_NP-13248
  @test
  Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Performing arts"
    Given Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
    When they select Resource Subtype "Performing arts"
    Then they see fields:
      | More information |
    And they see field for Type Work with options:
      | Theater/show  |
      | TV/film/radio |
      | Other         |
    And they see a list of Exhibition Places with fields:
      | Name       |
      | Date start |
      | Date end   |
      | Order      |
    And they see that each Exhibition Place has a Delete Button
    And they see that each Exhibition Place has an Edit Button
    And they see an Add Exhibition Place Button

  @TEST_NP-13249
  @test
  # Similar to Scenario for adding Exhibition Place to Artistic Design
  Scenario: Creator adds an Exhibition Place to Performing arts
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Performing arts"
    When they click the Add Exhibition Place Button
    Then they see the Add Exhibition Place Dialog
    And they see fields:
      | Exhibition place |
      | Date from        |
      | Date to          |
    And they see an Add Button
    When they fill the fields with input data
    And they click the Add Button
    Then the new Exhibition Place is listed under Exhibition places