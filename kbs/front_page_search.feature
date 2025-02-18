Feature: Anonymous user finds KBS reports

  Background:
    Given a user is on the Project Search Page
    And is not logged in

  Scenario: Find KBS Projects in a given year
    When they filter by KBS Reporting Year
    Then only KBS Projects for the chosen KBS Reporting Year are returned

  @ignore("uncertain_if_filter_should_be_included")
  Scenario: Filter by KBS Projects
    When they filter by KBS Projects
    Then only KBS Projects are returned