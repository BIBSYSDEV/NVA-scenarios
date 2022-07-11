Feature: Creator selects Resource type Artistic Result and subtype Music

  Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Music"
    Given Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
    When they select Resource Subtype "Music"
    And they can add Exhibitions of type:
      | Concert                  |
      | Audio/visual publication |
      | Music score              |
      | Other performance        |
    And they can edit existing Exhibitions
    And they can delete existing Exhibitions

  Scenario: Creator adds a Concert to a Music result
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Music"
    When they add a Concert with details for:
      | Place  |
      | Date   |
      | Extent |
      | Works  |
    And each Work has details for:
      | Title    |
      | Composer |
      | Premiere |
    Then the Concert is listed under Exhibitions

  Scenario: Creator adds a Audio/visual publication to a Music result
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Music"
    When they add a Audio/visual publication with details for:
      | Format           |
      | Publisher        |
      | Catalogue number |
      | Track list       |
    And Format can be any of:
      | CD        |
      | DVD       |
      | Streaming |
      | Download  |
      | LP/EP     |
      | Other     |
    And each Track list item has details for:
      | Title    |
      | Composer |
      | Extent   |
    Then the Audio/visual publication is listed under Exhibitions

  Scenario: Creator adds a Music score to a Music result
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Music"
    When they add a Music score with details for:
      | Score     |
      | Movements |
      | Extent    |
      | Publisher |
      | ISMN      |
      | ISRC      |
    Then the Music score is listed under Exhibitions

  Scenario: Creator adds a Other performance to a Music result
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Music"
    When they add a Other performance with details for:
      | Type   |
      | Place  |
      | Extent |
      | Works  |
    And each Work has details for:
      | Title    |
      | Composer |
    Then the Other performance is listed under Exhibitions