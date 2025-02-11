Feature: Project Page displays KBS data

  Scenario: Number of Inclusions for KBS reported years are provided
    Given a Project that has previously reported for KBS
    When a user views the Project
    Then a list of Number of Inclusions for each reported year are provided

  Scenario: REK approvals are provided
    Given a Project with approval from REK
    When a user views the Project
    Then REK-identifier is provided

  @ignore("until_CTIS_is_integrated")
  Scenario: CTIS approvals are provided
    Given a Project with approval from CTIS
    When a user views the Project
    Then CTIS-identifier is provided

  Scenario: Health Project Type is provided
    Given a Project with Health Project Type
    When a user views the Project
    Then the Health Project Type is provided