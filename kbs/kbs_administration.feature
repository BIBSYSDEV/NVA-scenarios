Feature: KBS Admin administration

  Background:
    Given a user is logged in as KBS Admin

  Scenario: Should be able to close an open Reporting Period
    Given an open Reporting Period
    When the user closes the period
    Then it is closed

  Scenario: Should be able to close an open Reporting Period when there are KBS Candidates
    Given an open Reporting Period
    And a KBS Candidate for the given period exists
    When the user closes the period
    Then it is closed

  Scenario: Should be able to close an open reporting period when there are Reportable Projects yet to report
    Given an open Reporting Period
    And a KBS Reportable Project for given period has yet to report
    When the user closes the period
    Then it is closed

  Scenario: Open a reporting period
    Given a closed Reporting Period
    When the user opens the period
    Then it is open

  Scenario: Opening a period should allow KBS reporting
    Given a closed Reporting Period
    When the user opens the period
    And a Project Manager reports for their KBS Reportable Project
    Then the KBS Reportable Project is reported

  Scenario: Finalize closed reporting period
    Given a closed Reporting Period
    When the user finalize the period
    Then it is finalized

  Scenario: Should not be able to finalize open reporting period
    Given an open Reporting Period
    When the user finalize the period
    Then they are denied

  Scenario Outline: Should not be able to alter finalized period
    Given a finalized Reporting Period
    When the user <Action> the period
    Then they are denied

    Examples:
      | Action |
      | open   |
      | close  |

  Scenario: Requesting a KBS Report
    When the user request a KBS report for a Reporting Period
    Then a report for the peroiod is made available

  Scenario Outline: Inspecting a Reporting Period should provide all KBS related Projects for given period
    When the user inspects a Reporting Period
    Then all <Project type> for the period is provided

    Examples:
      | Project type            |
      | KBS Candidates          |
      | KBS Reportable Projects |

  Scenario Outline: Inspecting a Reporting Period should not provide KBS related Projects for other periods
    When the user inspects a Reporting Period
    Then <Project type> for other periods are not provided

    Examples:
      | Project type            |
      | KBS Candidates          |
      | KBS Reportable Projects |

  Scenario: When inspecting KBS Reportable Projects for a Reporting Period, Total Number of Inclusions should be provided
    When the user inspects a KBS Reportable Project for a Reporting Period
    Then the Total Number of Inclusions for given period is provided if reported

Feature: Non KBS Admin user

  Background:
    Given a user not logged in as KBS Admin

  Scenario Outline: Should not be able to edit Reporting Period
    Given a Reporting Period with status <Status>
    When the user <Action> the period
    Then they are denied

    Examples:
      | Status    | Action    |
      | Open      | Closes    |
      | Open      | Finalizes |
      | Closed    | Opens     |
      | Closed    | Finalizes |
      | Finalized | Opens     |
      | Finalized | Closes    |

  Scenario Outline: No one can report for a closed Reporting Period
    Given a closed Reporting Period
    When the user is <Role> and reports for their KBS Reportable Project
    Then they are denied

    Examples:
      | Role                  |
      | KBS Admin             |
      | Project Manager       |
      | Local Project Manager |
      | Project Participant   |
      | None Project Role     |

  Scenario: Should not be able to inspect a Reporting Period
    When the user inspects a Reporting Period
    Then they are denied

  Scenario: Should not be able to request a KBS Report
    When the user requests a KBS Report
    Then they are denied

Feature: System KBS administration

  Scenario: Create new Reporting Period when not existing
    Given no Reporting Period for Reporting Year YYYY exists
    And a KBS Candidate for the period
    When the KBS Candidate becomes KBS Reportable
    Then a Reporting Period for Reporting Year YYYY is created

  Scenario: Do not create duplicate Reporting Period if a period for a given year already exists
    Given a Reporting Period for Reporting Year YYYY exists
    And a KBS Candidate for the period
    When the KBS Candidate becomes KBS Reportable
    Then a duplicate Reporrting Period for Reporting Year YYYY is not created

  Scenario: Newly created Reporting Period should be open
    When a Reporting Period is created
    Then it is open

  Scenario: Reporting Period should not be deleted
    Given a Reporting Period
    When a delete request for the period is received
    Then it is denied

  Scenario: Reporting Period should not change reporting year
    Given a Reporting Period
    When a request to change Reporting Year is received
    Then it is denied

  Scenario: Produce and upload a KBS Report when Reporting Period is finalized
    When a Reporting Period is finalized
    Then a KBS Report for the period is produced
    And the report is made citeable in NVA

  Scenario Outline: Producing KBS Report contains data
    When a KBS Report for a Reporting Period is produced
    Then it contains column <Column>

    Examples:
      | Column               |
      | Project Identifier   |
      | Project Name         |
      | Reporting Period     |
      | Number of Inclusions |