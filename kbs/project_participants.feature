Feature: Project Participants

  Background:
    Given a Project Participant

  Scenario: Requesting KBS Projects
    When requesting their KBS Projects
    Then all KBS Projects where they are Project Participant should be provided

  Scenario: Should not be able to edit KBS Metadata
    When reporting KBS Metadata
    Then they are denied