Feature: Creator navigates to the description tab and handles Projects

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
    When they click Remove Project
    Then they see the Project is removed from the list of selected Projects
