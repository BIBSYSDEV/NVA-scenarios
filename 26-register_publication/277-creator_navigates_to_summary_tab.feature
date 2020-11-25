Feature: Creator navigates to Summary tab

  @277
  Scenario: Creator navigates to Summary tab with validation errors
    Given Creator begins registering a Registration in the Wizard
    And there are validation errors
    When they navigate to the Summary tab
    Then they see Error box for Validation errors
    And they see Information box for
      | Description       |
      | Reference         |
      | Contributors      |
      | Files and License |
    And they see the tab Description is clickable
    And they see the tab Reference is clickable
    And they see the tab Contributors is clickable
    And they see the tab Files and License is clickable
    And they see the tab Summary is selected
    And they see Previous is enabled
    And they see Save and present is enabled
    And they see Publish is disabled

  Scenario: Creator navigates to Summary tab without validation errors
    Given Creator begins registering a Registration in the Wizard
    And there are no validation errors
    When they navigate to the Summary tab
    Then they see Information box for
      | Description       |
      | Reference         |
      | Contributors      |
      | Files and License |
    And they see the tab Description is clickable
    And they see the tab Reference is clickable
    And they see the tab Contributors is clickable
    And they see the tab Files and License is clickable
    And they see the tab Summary is selected
    And they see Previous is enabled
    And they see Save and present is enabled
    And they see Publish is enabled
