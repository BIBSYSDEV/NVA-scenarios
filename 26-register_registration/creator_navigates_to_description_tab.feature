Feature: Creator navigates to Description tab

  @TEST_NP-4018
  @test
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
    And they see a Button for creating a new Project is enabled
    And they see Next is enabled
    And they see Save is enabled

  @TEST_NP-4017
  @test
  Scenario: Creator sees that fields are validated on Description tab
    Given Creator begins Wizard registration and navigates to Description tab
    When they click the Save button
    Then they can see "Mandatory" error messages for fields:
      | Title          |
      | Date published |

  @TEST_NP-4021
  @test
  @445
  Scenario: Creator searches for Project
    Given Creator begins Wizard registration and navigates to Description tab
    And they see a Search box for Projects
    When they enter search term in the Search box
    Then they see list of Projects matching the search term
    And they see title and associated Institutions for each Project

  @TEST_NP-4019
  @test
  @446
  Scenario: Creator adds a Project
    Given Creator searches for Project
    When they select a Project from the Search results
    Then the selected Project is added to the list of selected Projects

  @TEST_NP-4026
  @test
  @1774
  Scenario: Creator removes a Project
    Given Creator adds a Project
    When they click the Remove Project icon
    Then they see the Project is removed from the list of selected Projects

  @TEST_NP-4024
  @test
  Scenario: Creator opens dropdown with Allowed Vocabularies
    Given Creator begins Wizard registration and navigates to Description tab
    And their Institution has a Vocabulary set as "Allowed"
    When they click "Add Vocabulary"
    Then they can see a dropdown with Allowed Vocabularies

  @TEST_NP-4025
  @test
  @2446
  Scenario: Creator sees input field for an Allowed Vocabulary
    Given Creator opens dropdown with Allowed Vocabularies
    When they select an Allowed Vocabulary
    Then they see an input field for the selected Vocabulary

  @TEST_NP-4020
  @test
  @2448
  Scenario: Creator sees input field for a Default Vocabulary
    Given Creator begins Wizard registration
    And their Institution has a Vocabulary set as "Default"
    When the User navigates to Description tab
    Then they can see an input field for the Default Vocabulary

  @TEST_NP-4022
  @test
  @2556
  Scenario: Creator opens Project wizard Dialog for creating a new Project
    Given Creator begins Wizard registration and navigates to Description tab
    When the user opens the Project wizard Dialog for creating a new Project
    Then User opens the Project Wizard to register a new Project

  @test
  Scenario: Creator adds funding
    Given Creator begins Wizard registration and navigates to Description tab
    When they uses the option to add funding
    Then they see an option to add a funding source
    And they see an option to cancel the funding source

  @test
  Scenario: Creator adds funding from NFR
    Given Creator begins Wizard registration and navigates to Description tab
    And they add funding
    When they select NFR as a funding source
    Then they can search for NFR Project
    
  @test
  Scenario: Creator adds funding from a non-NFR funding source
    Given Creator begins Wizard registration and navigates to Description tab
    And they add funding
    When they select a non-NFR funding source
    Then they can register:
    | Project name |
    | ID           |
    | Sum          | 

