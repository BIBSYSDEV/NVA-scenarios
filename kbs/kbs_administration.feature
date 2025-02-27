Feature: KBS Admin administration

  Background:
    Given a user is logged in as KBS Admin

  Scenario: Admin closes Reporting Period
    Given an open Reporting Period
    When the user closes the Reporting Period
    Then the Reporting Period is closed

  Scenario: Admin closes already closed Reporting Period
    Given a closed Reporting Period
    When the user closes the Reporting Period
    Then the Reporting Period is closed


  Scenario: Can close an open Reporting Period when there are KBS Candidates
    Given an open Reporting Period
    And a KBS Candidate for the given Reporting Period exists
    When the user closes the Reporting Period
    Then the Reporting Period is closed

  Scenario: Can close an open Reporting Period when there are Projects yet to report
    Given an open Reporting Period
    And a KBS Project for given Reporting Period has yet to report
    When the user closes the Reporting Period
    Then the Reporting Period is closed

  Scenario: Admin opens a Reporting Period
    Given a closed Reporting Period
    When the user opens the Reporting Period
    Then the Reporting Period is open

  Scenario: Admin opens already open Reporting Period
    Given an open Reporting Period
    When the user opens the Reporting Period
    Then the Reporting Period is open

  Scenario: Opening a Reporting Period allows for KBS reporting
    Given a closed Reporting Period
    When the user opens the Reporting Period
    Then a Project Manager can report for their KBS Project

  Scenario: Finalize closed Reporting Period
    Given a closed Reporting Period
    When the user finalize the Reporting Period
    Then the Reporting Period is finalized

  Scenario: Not able to finalize open Reporting Period
    Given an open Reporting Period
    When the user finalize the Reporting Period
    Then they are denied

  Scenario Outline: Not able to alter finalized Reporting Period
    Given a finalized Reporting Period
    When the user tries to <Action> the Reporting Period
    Then they are denied

    Examples:
      | Action |
      | open   |
      | close  |

  Scenario: Requesting a KBS Report
    When the user requests a KBS Report for a Reporting Period
    Then a report for the Reporting Period is available

  Scenario Outline: Inspecting a Reporting Period provides all KBS related Projects for given Reporting Period
    When the user inspects a Reporting Period
    Then all <Project type> for the Reporting Period are returned

    Examples:
      | Project type   |
      | KBS Candidates |
      | KBS Projects   |

  Scenario Outline: Inspecting a Reporting Period does not provide KBS related Projects for other Reporting Periods
    When the user inspects a Reporting Period
    Then <Project type> for other Reporting Periods are not returned

    Examples:
      | Project type   |
      | KBS Candidates |
      | KBS Projects   |

  Scenario: When inspecting KBS Projects for a Reporting Period, Total Recruitment Number are returned
    When the user inspects a KBS Project for a Reporting Period
    Then the Total Recruitment Number for given Reporting Period is returned if reported

Feature: Non KBS Admin user

  Background:
    Given a user not logged in as KBS Admin

  Scenario Outline: Cannot edit Reporting Period
    Given a Reporting Period with status <Status>
    When the user tries to <Action> the Reporting Period
    Then they are denied

    Examples:
      | Status    | Action    |
      | Open      | close    |
      | Open      | finalize |
      | Closed    | open     |
      | Closed    | finalize |
      | Finalized | open     |
      | Finalized | close    |

  Scenario Outline: No one can report for a closed Reporting Period
    Given a closed Reporting Period
    And a KBS Project for the given Reporting Period
    And the user is logged in with <Role> role for the KBS Project
    When they report the KBS Project in the Closed Reporting Period
    Then they are denied

    Examples:
      | Role                  |
      | KBS Admin             |
      | Project Manager       |
      | Local Project Manager |
      | Project Participant   |
      | None Project Role     |

  Scenario: Cannot inspect a Reporting Period
    When the user inspects a Reporting Period
    Then they are denied

  Scenario: Cannot request a KBS Report
    When the user requests a KBS Report
    Then they are denied

Feature: System KBS administration

  Scenario: Create new Reporting Period when not existing
    Given no Reporting Period for Reporting Year YYYY exists
    And a KBS Candidate for the Reporting Period
    When the KBS Candidate becomes a KBS Project
    Then a Reporting Period for Reporting Year YYYY is created

  Scenario: Do not create duplicate Reporting Period if a Reporting Period for a given year already exists
    Given a Reporting Period for Reporting Year YYYY exists
    And a KBS Candidate for the Reporting Period
    When the KBS Candidate becomes a KBS Project
    Then the KBS Project is reported in the existing Reporting Period for YYYY
    And a duplicate Reporting Period for Reporting Year YYYY is not created

  Scenario: Newly created Reporting Periods are be open
    When a Reporting Period is created
    Then it is open

  Scenario: Reporting Periods cannot be deleted
    Given a Reporting Period
    When a delete request for the Reporting Period is received
    Then it is denied

  Scenario: Reporting Period cannot change Reporting Year
    Given a Reporting Period
    When a request to change Reporting Year is received
    Then it is denied

  Scenario: Produce and upload a KBS Report when Reporting Period is finalized
    When a Reporting Period is finalized
    Then a KBS Report for the Reporting Period is produced
    And the report is uploaded as an NVA dataset

  Scenario Outline: Producing KBS Report contains relevant data
    When a KBS Report for a Reporting Period is produced
    Then it contains column <Column>

    Examples:
      | Column               |
      | Project Identifier   |
      | Project Name         |
      | Reporting Period     |
      | Number of Inclusions |