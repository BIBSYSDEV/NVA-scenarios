Feature: KBS administration

  Background:
    Given a user is logged in as KBS Manager

  Scenario: Create a period for reporting
    Given there exists no period for reporting year YYYY
    And the year YYYY is not in the future
    Then the user should be able to create a period for year YYYY
    And this period should initially be open

  Scenario: Close a period for reporting
    Given there is an open period
    Then the user should be able to close the period
    When the user closes the given peroid
    Then no one can report for the given period

  Scenario: Open a period for reporting
    Given there is a closed period for year YYYY
    And the period for year YYYY is not finalized
    Then the user should be able to open the period

  Scenario: Finalize reporting period
    Given there is a closed period for year YYYY
    Then the user should be able to finalize the period
    And the system produces a finalized kbs report for year YYYY
    # Should this be a separate step/manually done? Think of potential CTIS data
    And the report should contain columns Project identifier, -name, reprting period, and number of inclusions

  Scenario: Produce report for an open period
    Given an open period exists
    Then the user should be able to produce a report for the given open period

  Scenario: Produce report for a closed period
    Given a closed period exists
    Then the user should be able to produce a report for the given closed period

  Scenario: Should not produce report for already finalized report
    Given a finalized period exists
    Then the user should not be able to produce a report for the given finalized period

  Scenario: List Projects and their reported inclusion numbers for a given open/closed period
    Given an open/closed period exists
    Then the user should be able to list all KBS Projects for the given period
    And number of inclusions for each Project
    And Projects missing inclusion numbers are marked
