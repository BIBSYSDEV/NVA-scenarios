Feature: Non Project user should not be able to do anything

  Background:
    Given a user without any Project roles

  Scenario: Requesting KBS Projects
    When requesting their KBS Projects
    Then no KBS Projects should be provided

  Scenario: Should not be able to edit any KBS metadata
    Then they should not be able to edit any KBS metadata