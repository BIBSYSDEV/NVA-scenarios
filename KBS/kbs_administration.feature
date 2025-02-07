Feature: KBS Admin administration

  Background:
    Given a user is logged in as KBS Admin

  Scenario: Should be able to close an open reporting period
    When a period is open
    Then they should be able to close the period

  Scenario: Should be able to close an open reporting period when there are KBS Candidates
    When a period is open
    And KBS Candidate for given period exists
    Then they should be able to close the period

  Scenario: Should be able to close an open reporting period when there are Reportable Projects yet to report
    When a period is open
    And a Reportable Project for given period has yet to report
    Then they should be able to close the period

  Scenario: No one can report for a closed period
    When a period is closed
    Then no one can report for the period

  Scenario: Open a reporting period
    When a period is closed
    Then they should be able to open the period

  Scenario: Opening a period should allow KBS reporting
    Given a closed period
    When they open the period
    Then reporting KBS metadata should be allowed for the given period

  Scenario: Finalize closed reporting period
    When a period is closed
    Then they should be able to finalize the period

  Scenario: Should not be able to finalize open reporting period
    When a period is open
    Then they should not be able to finalize the period

  Scenario Outline: Should not be able to alter finalized period
    When a period is finalized
    Then they should not be able to <Action> the period

    Examples:
      | Action |
      | Open   |
      | Close  |

  Scenario: Requesting a KBS Report
    When they request a KBS report for a period
    Then a report for the peroiod should be made available

  Scenario Outline: Inspecting a period should provide all Projects for given period
    When they inspect a period
    Then all <Project type> for the period should be provided

    Examples:
      | Project type            |
      | KBS Candidates          |
      | KBS Reportable Projects |

  Scenario Outline: Inspecting a period should not provide Projects for other periods
    When they inspect a period
    Then <Project type> for other periods should not be provided

    Examples:
      | Project type            |
      | KBS Candidates          |
      | KBS Reportable Projects |

  Scenario: When inspecting a KBS Reportable Project for a period, number of inclusions should be provided
    When they inspect a KBS Reportable Project for a period
    Then the number of inclusions should be provided if reported

Feature: Non KBS Admin user

  Background:
    Given a user not logged in as KBS Admin

  Scenario Outline: Should not be able to edit period
    When a period is <Current status>
    Then they should not be able to <Action> the period

    Examples:
      | Current status | Action   |
      | Open           | Close    |
      | Open           | Finalize |
      | Closed         | Open     |
      | Closed         | Finalize |
      | Finalized      | Open     |
      | Finalized      | Close    |

  Scenario: Should not be able to inspect a period
    When they inspect a period
    Then they should be denied

  Scenario: Should not be able to request a report
    When they request a report
    Then they should be denied

Feature: System KBS administration

  Scenario: Create new period when not existing
    Given no period for reporting year YYYY exists
    And a KBS Candidate for reporting year YYYY
    When the KBS Candidate becomes Reportable
    Then a period for year YYYY should be created

  Scenario: Do not create duplicate period if a period for a given year already exists
    Given a period for year YYYY exists
    And a KBS Candidate for reporting year YYYY
    When the KBS Candidate becomes Reportable
    Then a duplicate period for year YYYY should not be created

  Scenario: Newly created period should be open
    When a period is created
    Then it should be open

  Scenario: Period should not be deleted
    When a period is created
    Then it cannot be deleted

  Scenario: Period should not change reporting year
    When a period is created
    Then it cannot change reporting year

  Scenario: Produce and upload a period report when period is finalized
    When a period is finalized
    Then a report for the period is produced
    And the report is made citeable in NVA

  Scenario Outline: Producing report contains column
    When a report for a period is produced
    Then it contains column <Column>

    Examples:
      | Column               |
      | Project Identifier   |
      | Project Name         |
      | Reporting Period     |
      | Number of Inclusions |