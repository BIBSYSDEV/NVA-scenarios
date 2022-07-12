Feature: Creator selects Resource type Media Contribution

  @TEST_NP-4072
  Scenario: Creator navigates to the Resource Type tab and selects Resource type "Media Contribution"
    Given Creator navigates to Resource Type tab
    When they select the Resource type "Media Contribution"
    Then they see a list of subtypes:
      | Feature Article              |
      | Reader Opinion               |
      | Interview                    |
      | Blog post                    |
      | Podcast                      |
      | Participation in Radio or TV |

  @TEST_NP-4073
  Scenario: Creator navigates to the Resource Type tab and selects a Resource subtype for Media Contribution
    Given Creator navigates to the Resource Type tab and selects Resource type "Media Contribution"
    When they select a Resource Subtype
    Then they see field Medium with options:
      | Newspaper or Journal |
      | Internet             |
      | Radio                |
      | TV                   |
      | Other                |
    And they see field Format with options:
      | Text  |
      | Sound |
      | Video |
    And they see freetext input fields for:
      | Channel                   |
      | Name of series or program |
      | Name of issue or episode  |
    And they can see the DOI
