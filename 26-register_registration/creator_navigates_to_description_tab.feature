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
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Description tab
    And they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Title          |
      | Date published |

  @445
  Scenario: Creator searches for Project
    Given Creator begins registering a Registration in the Wizard
    When they navigate to the Description tab
    And they see a Search box for Projects
    And they enter search term in the Search box
    Then they see list of Projects matching the search term
    And they see title and associated Institutions for each Project

  @446
  Scenario: Creator adds a Project
    Given Creator has searched for a Project
    And they see Search results
    When they select a Project from the Search results
    Then the selected Project is added to the list of selected Projects

  @1774
  Scenario: Creator removes a Project
    Given Creator has added a Project
    When they click the Remove Project icon
    Then they see the Project is removed from the list of selected Projects

  @xxx
  Scenario: Creator adds a Vocabulary
    Given Creator begins registering a Registration in the Wizard
    And they navigate to the Description tab
    And their institution has a Vocabulary set as "Allowed"
    And this Vocabulary is not set as "Default"
    When they click "Add controlled Vocabulary"
    Then they can add the "Allowed" Vocabulary
    And they can add values for the added Vocabulary
