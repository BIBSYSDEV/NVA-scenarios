Feature: User edits Project

    Scenario: User opens the Project Wizard
        Given User opens My Projects
        When they click the Edit Button for a Project
        Then they see the Project Wizard
        And they see tabs:
            | Description  |
            | Participants |
            | Financing    |

    @xxx
    Scenario: User opens Description tab for Project
        Given User opens the Project Wizard
        When they click the Description tab
        Then they see fields:
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
    Scenario: User opens Participants tab for Project
        Given User opens the Project Wizard
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
        Given User opens the Project Wizard
        When they click the Financing tab
        Then they see fields for:
            | Financing Code |
        And they see a Previous Button
        And they see a Support Button
        And they see a Save Button

    @xxx
    Scenario: User adds a Financing source for Project
        Given User opens Financing tab for Project
        When they select a Financing source from the search field
        Then thay see that the Financing Code is added to the project
        And they see a Previous Button
        And they see a Support Button
        And they see a Save Button
