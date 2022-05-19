Feature: Application Administrator administers Customer Institutions

  @TEST_NP-4161
  @test
  @365
  Scenario: Application Administrator opens Institutions
    Given that the user is logged in as Application Administrator
    When they click the menu item Institutions
    Then they see the page Institutions
    And they see a table of all Customer Institutions
    And they see the table contains the fields
      | Name |
      | Date |
    And they see a button Edit that is enabled for each Institution
    And they see a button Add institution that is enabled

  @TEST_NP-4147
  @test
  @366
  Scenario: Application Administrator adds a Customer Institution
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

  @TEST_NP-4162
  @test
  @574
  Scenario: Application Administrator opens a Customer Institution
    Given that the user is logged in as Application Administrator
    When they open a Customer Institution
    Then they see fields:
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
    And they see the Save button
    And they see the list of current Institution Administrators
    And every Institution Administrator has a Remove button
    And they see button to add a new Institution Administrator
