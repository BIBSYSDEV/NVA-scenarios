Feature: KBS administration

  Background:
    Given a user is logged in as KBS Manager

  Scenario: Create a reporting period
    Given that no period for reporting year YYYY exists
    And the year YYYY is not in the future
    Then the user should be able to create a period for year YYYY
    When the period is created
    Then the period should initially be open

  Scenario: Close a reporting period
    Given there is an open period
    Then the user should be able to close the period
    When the user closes the peroid
    Then no one can report for the period

  Scenario: Open a reporting period
    Given there is a closed period
    And the period is not finalized
    Then the user should be able to open the period

  Scenario Outline: Finalize reporting period
    Given a closed period
    Then the user should be able to finalize the period
    When the user finalizes the period
    Then the system produces and uploads to NVA a KBS Report for the period
    # Should this be a separate step/manually done? Think of potential CTIS data
    And the user should not be able to <Action> the period

    Examples:
      | Action |
      | Open   |
      | Close  |

  Scenario Outline: Produce a KBS Report
    Given a non finalized period
    When the user requests a KBS report for the period
    Then a report should be procuced and downloaded
    And it should contain column <Column>

    Examples:
      | Column               |
      | Project Identifier   |
      | Project Name         |
      | Reporting Period     |
      | Number of Inclusions |

  Scenario: Should not produce KBS Report for finalized period
    Given a finalized period
    Then the user should not be able to produce a KBS Report for the period

  Scenario: Inspect KBS related Projects for a non finalized period
    Given a non finalized period
    When the user wants to inspect KBS related Projects for the period
    Then all KBS Candidates for the period should be provided
    And all KBS Reportable Projects for the period should be provided
    And number of inclusions for each KBS Reportable Project should be provided
