Feature: Front page search for KBS

  Scenario: Filter KBS reported year
    When on the Project Search Page
    Then filtering by KBS reported year should be possible

  @ignore("uncertain_if_filter_should_be_included")
  Scenario: Filter KBS reported Projects
    When on the Project Search Page
    Then filtering KBS Reportable Projects should be possible