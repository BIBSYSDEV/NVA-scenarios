Feature: Report on behalf of (Local) Project Manager

  Background:
    Given a user logged in as KBS Admin

  Scenario Outline: KBS Admin should be able to decide if a Project is Reportable
    When a Project is a KBS Candidate
    Then they should be able to decide that the Project is <Status>

    Examples:
      | Status         |
      | Reportable     |
      | not Reportable |

  Scenario Outline: KBS Admin should be able to insert KBS metadata
    When a Project is Reportable
    Then they should be able to insert <Input>
    # And it should be logged that a KBS Admin edited the data

    Examples:
      | Input                   |
      | Inclusion number        |
      | Date of first inclusion |
      | Date of last inclusion  |
      | Local inclusion number  |

  Scenario Outline: KBS Admin should be able to override KBS metadata
    When a Project is Reportable
    And a Project Manager has inserted <Input>
    Then the user should be able to change <Input>
    # And it should be logged that a KBS Admin edited the data

    Examples:
      | Input                   |
      | Inclusion number        |
      | Date of first inclusion |
      | Date of last inclusion  |
      | Local inclusion number  |

  Scenario: KBS Admin should not be able to edit non KBS related metadata
    When a Project is Reportable
    Then they should not be able to edit non KBS related metadata