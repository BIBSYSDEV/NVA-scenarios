Feature: Report on behalf of (Local) Project Manager

  Scenario Outline: KBS admin should be able to report on behalf of (Local) Project Manager
    Given a user is logged in as a KBS Manager
    And a Project is marked for KBS reporting
    And the reporting period is open
    Then they should be able to upsert <Input>
    # And it should be logged that an kbs_admin edited the data

    Examples:
      | Input                   |
      | Inclusion number        |
      | Date of first inclusion |
      | Date of last inclusion  |
      | Local inclusion number  |
