Feature: Report on behalf of (Local) Project Manager

  Background:
    Given a user logged in as KBS Admin

  Scenario Outline: KBS Admin should be able to decide if a Project is KBS Reportable
    When a Project becomes a KBS Candidate
    Then the user should be able to decide that the Project is <Status>

    Examples:
      | Status             |
      | KBS Reportable     |
      | not KBS Reportable |

  Scenario Outline: KBS Admin should be able to insert KBS Metadata
    When a Project becomes KBS Reportable
    Then the user should be able to insert <KBS Metadata>

    Examples:
      | KBS Metadata            |
      | Inclusion number        |
      | Date of first inclusion |
      | Date of last inclusion  |
      | Local inclusion number  |

  Scenario Outline: KBS Admin should be able to override KBS Metadata
    When a Project becomes KBS Reportable
    And the Project Manager has inserted <KBS Metadata>
    Then the user should be able to override <KBS Metadata>

    Examples:
      | KBS Metadata            |
      | Inclusion number        |
      | Date of first inclusion |
      | Date of last inclusion  |
      | Local inclusion number  |

  Scenario: KBS Admin should not be able to edit non KBS Metadata
    When a Project becomes KBS Reportable
    Then they should not be able to edit non KBS Metadata