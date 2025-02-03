Feature: Report on behalf of (Local) Project Manager

  Scenario: KBS admin should be able to report on behalf of (Local) Project Manager
    Given a user is logged in as kbs_admin
    And any Project is marked for KBS reporting
    And the reporting period is still open
    Then the user should be able to edit any KBS related data
#    And it should be logged that an kbs_admin edited the data