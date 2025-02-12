Feature: Report on behalf of (Local) Project Manager

  Background:
    Given a user logged in as KBS Admin

  Scenario Outline: KBS Admin should be able to mark a Project KBS Reportable or not
    Given a KBS Candidate
    When the user marks the Project <KBS Status>
    Then the Project is <KBS Status>

    Examples:
      | KBS Status         |
      | KBS Reportable     |
      | not KBS Reportable |

  Scenario Outline: KBS Admin should be able to insert KBS Metadata
    Given a KBS Reportable Project
    When the user edits the Project
    Then they can set a new value for <KBS Metadata>

    Examples:
      | KBS Metadata            |
      | Inclusion number        |
      | Date of first inclusion |
      | Date of last inclusion  |
      | Local inclusion number  |

  Scenario Outline: KBS Admin should be able to override KBS Metadata
    Given a KBS Reportable Project
    And a Project Manager has set a value for <KBS Metadata>
    When the user edits the Project
    Then they can set a new value for <KBS Metadata>

    Examples:
      | KBS Metadata            |
      | Inclusion number        |
      | Date of first inclusion |
      | Date of last inclusion  |
      | Local inclusion number  |

  Scenario: KBS Admin should not be able to edit non KBS Metadata
    Given a KBS Reportable Project
    When the user edits the Project
    Then they cannot set new values for metadata unrelated to KBS reporting