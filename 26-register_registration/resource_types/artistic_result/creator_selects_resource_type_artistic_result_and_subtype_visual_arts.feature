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
    And they see a list of Exhibitions
    And they see that each Exhibition has a Remove Button
    And they see that each Exhibition has an Edit Button
    And they see an Add Exhibition Button

  Scenario: Creator adds an Exhibition
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Visual Arts"
    When they add a Exhibition with details for:
      | Exhibition place |
      | Date from        |
      | Date to          |
    Then the new Exhibition is listed under Exhibitions

  Scenario: Creator removes an Exhibition
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Visual Arts"
    And they see an item in the list of Exhibitions
    When they click the Remove Exhibition Button
    Then the row is removed from list of Exhibitions
