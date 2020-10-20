Feature: Creator begins registering a Registration in the Wizard
  @443
  Scenario Outline: Creator begins registering a Registration in the Wizard
    Given Creator begins registering a Registration
    And they have selected <Method> for starting the Wizard
    When they click Start
    Then they see the Wizard
    Examples:
      | Method                 |
      | Link to registration    |
      | Upload file            |
