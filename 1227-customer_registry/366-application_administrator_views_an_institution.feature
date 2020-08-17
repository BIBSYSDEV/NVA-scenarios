  @366
  Scenario: Application Administrator views an Institution
    Given Application Administrator opens Institutions
    When they click Open on an Institution
    Then they see the page for the Institution
    And they see fields:
      | Name in organization registry |
      | Display name                  |
      | Short display name            |
      | CNAME                         |
      | Institution DNS               |
      | Administration ID             |
      | Feide Organization ID         |
    And a button Save that is enabled
