Feature: Project Page displays KBS data

  Scenario: Number of inclusions for KBS reported years is displayed
    Given a Project that has previously reported for KBS
    Then a list of inclusion numbers for each reported year should be displayed

  Scenario: REK/CTIS approvals displayed
    Given a Project with approval from REK and/or CTIS
    Then the approval id/identifier should be displayed

  Scenario:
    Given a Project with Health Project Type
    Then the Health Project Type should be displayed