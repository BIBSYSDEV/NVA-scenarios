Feature: Project Participants

  Background:
    Given a Project Participant

  Scenario: Requesting KBS Projects
    When requesting their KBS Projects
    Then all KBS Projects where they are Project Participant are returned

  Scenario: Is not able to edit KBS Metadata
    When reporting KBS Metadata
    Then they are denied