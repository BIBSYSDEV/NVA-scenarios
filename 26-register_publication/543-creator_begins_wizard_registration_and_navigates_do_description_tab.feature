  Feature: Creator begins Wizard registration and navigates to Description tab

  Scenario: Creator begins Wizard registration and navigates to Description tab
    Given Creator begins registering a Publication in the Wizard
    When they navigate to the Description tab
    Then they see the tab Description is selected
    And they see mandatory fields for
      | Title |
    And they see optional fields for
      | Abstract                     |
      | Description                  |
      | Date published               |
      | NPI disciplines              |
      | Keywords                     |
      | Primary language for content |
      | Project association          |
    And they see the tab Reference is clickable
    And they see the tab Contributor is clickable
    And they see the tab Files and Licenses is clickable
    And they see the tab Summary is clickable
    And they see Next is enabled
    And they see Save is enabled