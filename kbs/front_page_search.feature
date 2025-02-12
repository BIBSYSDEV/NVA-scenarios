Feature: Front page search for KBS

  Scenario: Filter by KBS reported year
    Given a user is on the Project Search Page
    When they filter by KBS Reporting Year
    Then only KBS Reportable Projects for the KBS Reporting Year are provided

  @ignore("uncertain_if_filter_should_be_included")
  Scenario: Filter by KBS Reportable Projects
    Given a user is on the Project Search Page
    When they filter by KBS Reportable Projects
    Then only KBS Reportable Projects are provided