Feature: Creator navigates to Files and License tab

  @275
  Scenario: Creator navigates to Files and License tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Files and License tab
    Then they see the File upload widget
    And they see the tab Description is clickable
    And they see the tab Resource Type is clickable
    And they see the tab Contributors is clickable
    And they see the tab Files and License is selected
    And they see Previous is enabled
    And they see Next is enabled
    And they see Save is enabled
