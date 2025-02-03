Feature: Front page search for KBS

  Scenario: Facet for KBS reported year
    Given a user visits the front page
    And navigates to Project filter
    Then the user should be able to select a facet for KBS reported year

    # Is this one necessary?
    Scenario: Facet for KBS reported Projects (Yes/No)
      Given a user visits the front page
      And navigates to Project filter
      Then the user should be able to select a facet "yes" or "no" for KBS reported Projects