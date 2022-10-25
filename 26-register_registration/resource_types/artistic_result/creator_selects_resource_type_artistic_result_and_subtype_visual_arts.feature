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
    And they can add an Exhibition

  Scenario: Creator adds an Exhibition
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Visual Arts"
    When they add an Exhibition with details for:
      | Exhibition place |
      | Date from        |
      | Date to          |
    Then the new Exhibition is listed under Exhibitions
    And they can edit the Exhibition
    And they can remove the Exhibition
