Feature: Creator selects Resource type Artistic Result and subtype Architecture

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
    And they see an Add Competition Button
    And they see an Add Publication/Mention Button
    And they see an Add Prize/Award Button
    And they see an Add Exhibition Button

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

  Scenario: Creator adds an Publication/Mention
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they click the Add Publication/Mention Button
    Then they see the Add Publication/Mention Dialog
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
    Then the Publication/Mention is listed under Exhibitions

  Scenario: Creator adds an Prize/Award
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Architecture"
    When they click the Add Prize/Award Button
    Then they see the Add Prize/Award Dialog
    And they see fields:
      | Name        |
      | Organizer   |
      | Year        |
      | Ranking     |
      | Description |
    And they see an Add Button
    When they fill the fields with input data
    And they click the Add Button
    Then the Prize/Award is listed under Exhibitions

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
