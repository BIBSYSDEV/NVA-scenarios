Feature: Creator navigates to Description tab

  @452
  Scenario: Creator begins Wizard registration and navigates to Description tab
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Description tab
    Then they see the Description tab is selected
    And they see fields:
      | Title                        |
      | Abstract                     |
      | Description                  |
      | Date published               |
      | Keywords                     |
      | Vocabularies                 |
      | Primary language for content |
      | Project association          |
    And they see the tab Resource Type is clickable
    And they see the tab Contributors is clickable
    And they see the tab Files and License is clickable
    And they see Next is enabled
    And they see Save is enabled

  Scenario: Creator sees that fields are validated on Description tab
    Given Creator begins Wizard registration and navigates to Description tab
    When they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Title          |
      | Date published |

  @445
  Scenario: Creator searches for Project
    Given Creator begins Wizard registration and navigates to Description tab
    And they see a Search box for Projects
    When they enter search term in the Search box
    Then they see list of Projects matching the search term
    And they see title and associated Institutions for each Project

  @446
  Scenario: Creator adds a Project
    Given Creator searches for Project
    When they select a Project from the Search results
    Then the selected Project is added to the list of selected Projects

  @1774
  Scenario: Creator removes a Project
    Given Creator adds a Project
    When they click the Remove Project icon
    Then they see the Project is removed from the list of selected Projects

  Scenario: Creator opens list of Allowed Vocabularies
    Given Creator begins Wizard registration and navigates to Description tab
    And their Institution has a Vocabulary set as "Allowed"
    When they click "Add Vocabulary"
    Then they can see list of Vocabularies that are Allowed

  @2446
  Scenario: Creator sees input field for an Allowed Vocabulary
    Given Creator opens list of Allowed Vocabularies
    When they select an Allowed Vocabulary
    Then they see an input field for the selected Vocabulary

  @2448
  Scenario: Creator sees input field for a Default Vocabulary
    Given Creator begins Wizard registration and navigates to Description tab
    When their Institution has a Vocabulary set as "Default"
    Then they can see an input field for the Default Vocabulary
