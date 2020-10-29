Feature: Creator navigates to Contributors tab

  @417
  Scenario: Creator navigates to Contributors tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Contributors tab
    Then they see Add Author is enabled
    And they see the tab Description is clickable
    And they see the tab Reference is clickable
    And they see the tab Contributors is selected
    And they see the tab Files and License is clickable
    And they see the tab Summary is clickable
    And they see Next is enabled
    And they see Save is enabled
