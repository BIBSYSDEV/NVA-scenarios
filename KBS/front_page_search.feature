Feature: Front page search for KBS

  Scenario: Facet for KBS reported year
    Given a user visiting the Front Page
    When they navigate to the Project Search
    Then they should be able to select a facet for KBS reported year

  # Is this one necessary?
  Scenario: Facet for KBS reported Projects
    Given a user visiting the Front Page
    When they navigate to the Project Search
    Then they should be able to select a facet listing all KBS reported Projects