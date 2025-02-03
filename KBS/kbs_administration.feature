Feature: KBS administration

  Scenario: Create a period for reporting
    Given a user is logged in as kbs_admin
    And there exists no period for reporting year YYYY
    And the year YYYY is not in the future
    Then the user should be able to create a period for year YYYY
    And this period should initially be open

  Scenario: Close a period for reporting
    Given a user is logged in as kbs_admin
    And there is an open period
    Then the user should be able to close the period
    And no one can report for the given period

  Scenario: Open a period for reporting
    Given a user is logged in as kbs_admin
    And there is a closed period for year YYYY
    And the period for year YYYY is not finalized
    Then the user should be able to open the period

  Scenario: Finalize reporting period
    Given a user is logged in as kbs_admin
    And there is a closed period for year YYYY
    Then the user should be able to finalize the period
    And the system produces a finalized kbs report for year YYYY (or separate step? Manually?)
    And the report should contain columns Project identifier, -name, reprting period, and number of inclusions

  Scenario: Produce report for an open period
    Given a user is logged in as kbs_admin
    And an open period exists
    Then the user should be able to produce a tentative report for the given open period

  Scenario: Produce report for a closed period
    Given a user is logged in as kbs_admin
    And a closed period exists
    Then the user should be able to produce a tentative report for the given closed period

  Scenario: Should not produce report for already finalized report
    Given a user is logged in as kbs_admin
    And a finalized period exists
    Then the user should not be able to produce a report for the given finalized period

  Scenario: List Projects and their reported inclusion numbers for a given open/closed period
    Given a user is logged in as kbs_admin
    And an open/closed period exists
    Then the user should be able to list all Projects for the given period
    And number of inclusions for each Project
    And a dash for Projects missing inclusion numbers
