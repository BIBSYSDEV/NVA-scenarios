Feature: Creator navigates to Resource Type tab

  @453
  Scenario: Creator navigates to Resource Type tab
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    Then they see the field for Type
    And they see the tab Description is clickable
    And they see the tab Resource Type is selected
    And they see the tab Contributors is clickable
    And they see the tab Files and License is clickable
    And they see Previous is enabled
    And they see Next is enabled
    And they see Save is enabled

  Scenario: Creator sees that fields are validated on Resource Type tab
    Given Creator begins registering a Registration in the Wizard with a File
    When they navigate to the Resource Type tab
    And they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Type |
