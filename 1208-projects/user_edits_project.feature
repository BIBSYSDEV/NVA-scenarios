Feature: User edits Project

    @xxx
    Scenario: User sees the Project Wizard
        Given User is logged in
        When they open the Project Wizard
        Then the User is the Project Owner
        And they see tabs:
            | Description  |
            | Participants |
            | Financing    |
        And they see the Description tab
        And they see fields:
            | Title                    |
            | Summary                  |
            | Coordinating Institution |
            | Start Date               |
            | End Date                 |
            | Internal Project Code    |
        And they see a Support Button
        And they see a Save Button
        And they see a Next Button

    @xxx
    # Her skal ein del kos inn...
    # denne må rolle styres, ulike roller har tilgang til å endre på ulike felter
    Scenario Outline: User opens a Project in the Project Wizard
        Given User has the "<Role>" role in the projects scope
        When they click the Edit button
        Then User sees the Project Wizard
        And it contains data about the Project
        Examples:
            | Role                  |
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |

    @xxx
    Scenario: User opens Participants tab for Project
        Given User sees the Project Wizard
        When they click the Participants tab
        Then they see lists of:
            | Project Manager      |
            | Project Participants |
        And they see Buttons:
            | Add Project Manager     |
            | Add Project Participant |
        And they see a Previous Button
        And they see a Support Button
        And they see a Save Button
        And they see a Next Button

    Scenario: User opens Dialog for adding Project Manager
        Given User opens Participants tab for Project
        When they click the Add Project Manager Button
        Then they see fields:
            | Start Date  |
            | User search |

    @xxx
    Scenario: User adds a Project Manager
        Given User opens Dialog for adding Project Manager
        When they select a Start Date
        And they select a User from the search
        And they click the Add Button
        Then they see the User listed as a Project Manager

    Scenario: User opens Dialog for adding Project Participant
        Given User opens Participants tab for Project
        When they click the Add Project Participant Button
        Then they can select role to be either of:
            | Project Partcipant    |
            | Local Project Manager |
        And they can see User search field

    @xxx
    Scenario: User adds a Project Participant
        Given User opens Dialog for adding Project Participant
        When they select a role
        And they select a User from the search
        And they click the Add Button
        Then they see the User listed as a Project Participant

    @xxx
    Scenario: User opens Financing tab for Project
        Given User sees the Project Wizard
        When they click the Financing tab
        Then they see fields for:
            | Financing Code |
        And they see a Previous Button
        And they see a Support Button
        And they see a Publish Button

    @xxx
    Scenario: User adds a Financing source for Project
        Given User opens Financing tab for Project
        When they select a Financing source from the search field
        Then they see that the Financing Code is added to the project
        And they see a Previous Button
        And they see a Support Button
        And they see a Publish Button

    @xxx
    Scenario: User Save a Project
    Given User sees the Project Wizard
    When the User clicks on the Save Button
    Then the project is saved with a Draft status
    And the User is the Project Owner
    And only the Project Owner can access it's Landing Page 

    @xxx
    Scenario: User Publish a Project
    Given User opens Financing tab for Project
    And the User is the Project Owner
    When the User clicks on the Publish Button
    Then the project status is now Published 
    And it has a public accessible Landing Page

