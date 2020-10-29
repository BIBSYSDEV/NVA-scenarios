Feature: Creator navigates to the description tab and handles Projects

  Scenario: Creator searches for Project
    Given Creator begins registering a Publication in the Wizard
    When they navigate to the Description tab
    And they see input field for Projects
    And they enter search term in Projects field
    Then they see list of Projects matching the search term
    And they see associated institutions for each Project

  Scenario: Creator adds a Project
    Given Creator has searched for a project
    And they can see search results
    When they click on a Project from the search results
    Then the clicked Project are added to to list of selected Projects

  Scenario: Creator removes a Project
    Given Creator has added a Project
    When they click button for removing Project
    Then they see the Project is no longer listed among selected Projects