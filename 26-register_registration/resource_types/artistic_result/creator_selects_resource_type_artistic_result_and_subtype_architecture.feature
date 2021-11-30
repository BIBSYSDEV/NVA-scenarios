Feature: Creator selects Resource type Artistic Result and subtype Architecture

  @3413
  Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    Given Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
    When they select Resource Subtype "Architecture"
    Then they see fields:
      | More information |
    And they see field for Type Work with options:
      | Construction           |
      | Plan proposal          |
      | Landscape architecture |
      | Interior               |
      | Other                  |
    And they see a list of Exhibitions with fields:
      | Name  |
      | Date  |
      | Order |
    And they see that each Exhibition has a Delete Button
    And they see that each Exhibition has an Edit Button
    And see they Buttons for:
      | Add Competition            |
      | Add Publication or Mention |
      | Add Prize or Award         |
      | Add Exhibition             |

  @3414
  Scenario: Creator adds an Competition
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they click the Add Competition Button
    Then they see the Add Competition Dialog
    And they see fields:
      | Name        |
      | Description |
      | Date        |
    And they see an Add Button
    When they fill the fields with input data
    And they click the Add Button
    Then the Competition is listed under Exhibitions

  @3415
  Scenario: Creator adds an Publication or Mention
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they click the Button Add Publication or Mention
    Then they see the Dialog for Add Publication or Mention
    And they see fields:
      | Name        |
      | Issue       |
      | Page from   |
      | Page to     |
      | Date        |
      | Description |
    And they see an Add Button
    When they fill the fields with input data
    And they click the Add Button
    Then the Publication or Mention is listed under Exhibitions

  @3416
  Scenario: Creator adds an Prize or Award
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they click the Add Prize or Award Button
    Then they see the Add Prize or Award Dialog
    And they see fields:
      | Name        |
      | Organizer   |
      | Year        |
      | Ranking     |
      | Description |
    And they see an Add Button
    When they fill the fields with input data
    And they click the Add Button
    Then the Prize or Award is listed under Exhibitions

  @3417
  Scenario: Creator adds an Exhibition
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they click the Add Exhibition Button
    Then they see the Add Exhibition Dialog
    And they see fields:
      | Name        |
      | Place       |
      | Organizer   |
      | Date from   |
      | Date to     |
      | Description |
    And they see an Add Button
    When they fill the fields with input data
    And they click the Add Button
    Then the Exhibition is listed under Exhibitions
