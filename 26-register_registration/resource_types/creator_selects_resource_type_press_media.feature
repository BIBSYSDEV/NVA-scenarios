Feature: Creator selects Resource type Press/Media

  @3231
  Scenario: Creator navigates to the Resource Type tab and selects Resource type "Press/Media"
    Given Creator navigates to Resource Type tab
    When they select the Resource type "Press/Media"
    Then they see a list of subtypes:
      | Interview               |
      | Documentary             |
      | Programme participation |
      | Programme management    |

  @3232
  Scenario: Creator navigates to the Resource Type tab and selects a Resource subtype for Press/Media
    Given Creator navigates to the Resource Type tab and selects Resource type "Press/Media"
    When they select a Resource Subtype
    Then they see fields:
      | Place   |
      | Program |
      | Type    |

  @3233
  Scenario: Creator selects a type for subtype Press/Media
    Given Creator navigates to the Resource Type tab and selects Resource type "Press/Media"
    When they select Type
    Then they see fields:
      | Newspaper |
      | Journal   |
      | Radio     |
      | TV        |
      | Internet  |
      | Other     |
