Feature: Project Page displays KBS data

  Scenario: Recruitment Number for KBS reported years are provided
    Given a Project that has previously reported for KBS
    When a user views the Project
    Then a list of Recruitment Numbers for each reported year is returned

  Scenario: REK approvals are provided
    Given a Project with approval from REK
    When a user views the Project
    Then REK-identifier is returned

  @ignore("until_CTIS_is_integrated")
  Scenario: CTIS approvals are provided
    Given a Project with approval from CTIS
    When a user views the Project
    Then CTIS-identifier is returned

  Scenario: Health Project Type is provided
    Given a Project with Health Project Type
    When a user views the Project
    Then the Health Project Type is returned