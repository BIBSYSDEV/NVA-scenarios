Feature: Creator navigates to Reference tab

  @453
  Scenario: Creator navigates to Reference tab
    Given Creator begins registering a Publication in the Wizard
    When they navigate to the Reference tab
    Then they see the field for Type
    And they see the tab Description is clickable
    And they see the tab Reference is selected
    And they see the tab Contributors is clickable
    And they see the tab Files and License is clickable
    And they see the tab Summary is clickable
    And they see Next is enabled
    And they see Save is enabled

  Scenario: Creator sees that fields are validated on Reference tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Reference tab
    And they click the Save button
    Then they can see "Required field" error messages for fields:
        | Type |