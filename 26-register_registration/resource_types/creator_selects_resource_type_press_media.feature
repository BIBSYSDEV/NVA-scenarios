Feature: Creator selects Resource type Press/Media

  @3231
  Scenario: Creator navigates to the Resource Type tab and selects Resource type "Press/Media"
    Given Creator navigates to Resource Type tab
    When they select the Resource type "Press/Media"
    Then they see a list of subtypes:
      | Interview               |
      | Blog                    |
      | Podcast                 |
      | Programme participation |
      | Programme management    |

  @3232
  Scenario: Creator navigates to the Resource Type tab and selects a Resource subtype for Press/Media
    Given Creator navigates to the Resource Type tab and selects Resource type "Press/Media"
    When they select a Resource Subtype
    Then they see fields:
      | DOI                    |
      | Publisher              |
      | Name of series/program |
      | Name of issue/episode  |
    And they see field Medium with options:
      | Newspaper or Journal |
      | Internet             |
      | Radio                |
      | TV                   |
      | Other                |
    And they see field Format with options:
      | Text  |
      | Sound |
      | Video |
