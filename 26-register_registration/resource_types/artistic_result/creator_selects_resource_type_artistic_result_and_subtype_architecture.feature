Feature: Creator selects Resource type Artistic Result and subtype Architecture

  @3413
  Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    Given the creator wants to add an Artistic Result - Architecture
    Then they can add information about:
      | Construction           |
      | Plan proposal          |
      | Landscape architecture |
      | Interior               |
      | Other                  |
    And they can add Exhibitions of type:
      | Competition            |
      | Publication or Mention |
      | Prize or Award         |
      | Exhibition             |
    And they can edit existing Exhibitions
    And they can delete existing Exhibitions


  @3414
  Scenario: Creator adds an Competition
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they add a Competition with details for:
      | Name        |
      | Description |
      | Date        |
    Then the Competition is listed under Exhibitions

  @3415
  Scenario: Creator adds an Publication or Mention
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they add a Publication or Mention with details for:
      | Name        |
      | Issue       |
      | Page from   |
      | Page to     |
      | Date        |
      | Description |
    Then the Publication or Mention is listed under Exhibitions

  @3416
  Scenario: Creator adds an Prize or Award
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they add a Prize or Award with details for:
      | Name        |
      | Organizer   |
      | Year        |
      | Ranking     |
      | Description |
    Then the Prize or Award is listed under Exhibitions

  @3417
  Scenario: Creator adds an Exhibition
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they add an Exhibition with details for:
      | Name        |
      | Place       |
      | Organizer   |
      | Date from   |
      | Date to     |
      | Description |
    Then the Exhibition is listed under Exhibitions
