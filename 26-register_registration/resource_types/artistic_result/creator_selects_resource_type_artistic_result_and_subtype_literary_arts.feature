Feature: Creator selects Resource type Artistic Result and subtype Literary Arts

  Scenario: Creator navigates to the Resource Type tab and selects Resource subtype "Literary Arts"
    Given Creator navigates to the Resource Type tab and selects Resource type "Artistic Result"
    When they select Resource Subtype "Literary Arts"
    Then they see fields:
      | More information |
    And they see field for Type Work with options:
      | Novel        |
      | Poetry       |
      | Novella      |
      | ShortFiction |
      | Essay        |
      | Translation  |
      | Retelling    |
      | Play         |
      | Other        |
    And they can add Announcements of type:
      | Monograph                |
      | Web Publication          |
      | Performance              |
      | Audio/Visual Publication |

  Scenario: Creator adds an Monograph
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Literary Arts"
    When they add a Monograph with details for:
      | Publisher   |
      | Year        |
      | ISBN        |
      | Total pages |
    Then the Monograph is listed under Announcements
    And they can edit the Monograph
    And they can remove the Monograph

  Scenario: Creator adds an Web Publication
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Literary Arts"
    When they add a Web Publication with details for:
      | Link      |
      | Publisher |
      | Year      |
    Then the Web Publication is listed under Announcements
    And they can edit the Web Publication
    And they can remove the Web Publication

  Scenario: Creator adds an Performance
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Literary Arts"
    When they add a Performance with details for:
      | Type of Performance |
      | Place               |
      | Date                |
    And Type of Performance can be one of:
      | Reading |
      | Play    |
      | Other   |
    Then the Performance is listed under Announcements
    And they can edit the Performance
    And they can remove the Performance

  Scenario: Creator adds an Audio/Visual Publication
    Given Creator navigates to the Resource Type tab and selects Resource subtype "Literary Arts"
    When they add an Audio/Visual Publication with details for:
      | Type of audio/visual publication |
      | Publisher                        |
      | Year                             |
      | ISBN                             |
      | Duration                         |
    And Type of Type of audio/visual publication can be one of:
      | Audiobook |
      | RadioPlay |
      | ShortFilm |
      | Podcast   |
      | Other     |
    Then the Audio/Visual Publication is listed under Announcements
    And they can edit the Audio/Visual Publication
    And they can remove the Audio/Visual Publication
