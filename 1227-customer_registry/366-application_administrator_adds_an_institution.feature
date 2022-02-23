Feature: Application Administrator adds an Institution

  @TEST_NP-4147
  @test
  @366
  Scenario: Application Administrator adds an Institution
    Given that the user is logged in as Application Administrator
    And they click the menu item Institutions
    When they click Add Institution
    Then they see the Add Institution page
    And they see fields:
      | Name in organization registry |
      | Display name                  |
      | Short display name            |
      | Archive name                  |
      | Feide Organization ID         |
      | ROR ID                        |
    And they see login options:
      | Feide   |
      | MinID   |
      | HelseID |
    And a button Create that is enabled