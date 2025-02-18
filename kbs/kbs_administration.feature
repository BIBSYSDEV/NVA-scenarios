Feature: KBS Admin administration

  Background:
    Given a user is logged in as KBS Admin

  Scenario: Can close an open Reporting Period
    Given an open Reporting Period
    When the user closes the period
    Then it is closed

  Scenario: Can close an open Reporting Period when there are KBS Candidates
    Given an open Reporting Period
    And a KBS Candidate for the given period exists
    When the user closes the period
    Then it is closed

  Scenario: Can close an open Reporting Period when there are Projects yet to report
    Given an open Reporting Period
    And a KBS Project for given period has yet to report
    When the user closes the period
    Then it is closed

  Scenario: Open a Reporting Period
    Given a closed Reporting Period
    When the user opens the period
    Then it is open

  Scenario: Opening a Reporting Period allows for KBS reporting
    Given a closed Reporting Period
    When the user opens the period
    Then a Project Manager can report for their KBS Project

  Scenario: Finalize closed Reporting Period
    Given a closed Reporting Period
    When the user finalize the period
    Then it is finalized

  Scenario: Not able to finalize open Reporting Period
    Given an open Reporting Period
    When the user finalize the period
    Then they are denied

  Scenario Outline: Not able to alter finalized Reporting Period
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

  Scenario Outline: Inspecting a Reporting Period provides all KBS related Projects for given period
    When the user inspects a Reporting Period
    Then all <Project type> for the period are provided

    Examples:
      | Project type   |
      | KBS Candidates |
      | KBS Projects   |

  Scenario Outline: Inspecting a Reporting Period does not provide KBS related Projects for other periods
    When the user inspects a Reporting Period
    Then <Project type> for other periods are not provided

    Examples:
      | Project type   |
      | KBS Candidates |
      | KBS Projects   |

  Scenario: When inspecting KBS Projects for a Reporting Period, Total Recruitment Number are provided
    When the user inspects a KBS Project for a Reporting Period
    Then the Total Recruitment Number for given period is provided if reported

Feature: Non KBS Admin user

  Background:
    Given a user not logged in as KBS Admin

  Scenario Outline: Cannot edit Reporting Period
    Given a Reporting Period with status <Status>
    When the user <Action> the period
    Then they are denied

    Examples:
      | Status    | Action    |
      | Open      | closes    |
      | Open      | finalizes |
      | Closed    | opens     |
      | Closed    | finalizes |
      | Finalized | opens     |
      | Finalized | closes    |

  Scenario Outline: No one can report for a closed Reporting Period
    Given a closed Reporting Period
    And a KBS Project for given period
    And the user is logged in with <Role> role for the KBS Project
    When they report for the KBS Project
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
    When the KBS Candidate becomes a KBS Project
    Then a Reporting Period for Reporting Year YYYY is created

  Scenario: Do not create duplicate Reporting Period if a period for a given year already exists
    Given a Reporting Period for Reporting Year YYYY exists
    And a KBS Candidate for the period
    When the KBS Candidate becomes a KBS Project
    Then a duplicate Reporting Period for Reporting Year YYYY is not created

  Scenario: Newly created Reporting Periods are be open
    When a Reporting Period is created
    Then it is open

  Scenario: Reporting Periods cannot be deleted
    Given a Reporting Period
    When a delete request for the period is received
    Then it is denied

  Scenario: Reporting Period cannot change reporting year
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