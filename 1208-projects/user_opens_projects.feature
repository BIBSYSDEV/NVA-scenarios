Feature: User opens Projects

    @xxx
    Scenario: User opens My Projects
        Given that a User is logged in
        When they navigate to the Projects Page
        Then they see a list of Projects where they are either of:
            | Participant           |
            | Local Project Manager |
            | Project Manager       |
        And the Projects are divided into:
            | Active Projects    |
            | Concluded Projects |
        And each Project has a View Button
        And each Project where they are <Role> has an "<EditButtonStatus>" Edit Button
        And each Project where they are <Role> has an "<DeleteButtonStatus>" Delete Button
        And they see a Create New Project Button
        Examples:
            | Role                  | EditButtonStatus | DeleteButtonStatus |
            | Participant           | disabled         | disabled           |
            | Project Manager       | disabled         | disabled           |
            | Local Project Manager | enabled          | enabled            |

    Scenario: User clicks the Create New Project Button
        Given User opens My Projects
        When they click Create New Project Button
        Then User opens the Project Wizard

    Scenario: User clicks the View Button for a Project
        Given User opens My Projects
        When they click the View Button for a Project
        Then User opens Landing Page for Project

    Scenario: User clicks the Delete Button for a Project
        Given User opens My Projects
        When they click the Delete Button for a Project where they are Manager
        Then they see a Confirm Dialog

    @xxx
    Scenario: User deletes a Project
        Given User clicks the Delete Button for a Project
        When they Confirm the action
        Then the Confirm Dialog is closed
        And The actual Project is removed from the Projects list
