Feature: Creator selects Resource type Artistic Result and subtype Visual Arts

  Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Visual Arts"
    Given Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
    When they select Resource Subtype "Visual Arts"
    Then they see fields:
      | More information |
    And they see field for Type Work with options:
      | IndividualExhibition |
      | CollectiveExhibition |
      | Installation         |
      | ArtInPublicSpace     |
      | Performance          |
      | AudioArt             |
      | ArtistBook           |
      | Other                |
    And they see a list of Exhibition Places
    And they see that each Exhibition Place has a Remove Button
    And they see that each Exhibition Place has an Edit Button
    And they see an Add Exhibition Place Button

  Scenario: Creator adds an Exhibition Place
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Visual Arts"
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

  Scenario: Creator Deletes an Exhibition Place
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Visual Arts"
    And they see an item in the list of Exhibition Places
    When they click the Delete Exhibition Place Button
    Then the row is removed from list of Exhibition Places
