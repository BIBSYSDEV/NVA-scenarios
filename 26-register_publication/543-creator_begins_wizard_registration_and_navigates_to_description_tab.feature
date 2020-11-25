  Feature: Creator begins Wizard registration and navigates to Description tab

  Scenario: Creator begins Wizard registration and navigates to Description tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Description tab
    Then they see the Description tab is selected
    And they see fields:
      | Title |
      | Abstract                     |
      | Description                  |
      | Date published               |
      | NPI disciplines              |
      | Keywords                     |
      | Primary language for content |
      | Project association          |
    And they see the tab Reference is clickable
    And they see the tab Contributors is clickable
    And they see the tab Files and License is clickable
    And they see the tab Summary is clickable
    And they see Previous is enabled
    And they see Next is enabled
    And they see Save is enabled

  Scenario: Creator sees that fields are validated on Description tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Description tab
    And they click the Save button
    Then they can see "Required field" error messages for fields:
        | Title |
