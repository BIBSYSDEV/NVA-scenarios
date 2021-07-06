Feature: User edits Project
    In order to document a project 
    As a logged in User
    I want to edit existing and create new projects

    @xxx
    Scenario Outline: User sees the Project Wizard
        Given User opens My Projects
        When they click Create New Project Button
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
        # Save button is removed as Project API demands a PM
        And they see a Next Button

    @xxx
    Scenario: Curator opens a Project in the Project Wizard
        # Same end result as "User Edits a Project in the Project Wizard"
        # but this one enables a Curator to edit projects where he's not an
        # participant (as an ordinary User)
        Given User opens Landing Page for Project
        And User is Curator on Project's Project Owner's Institution
        And the project lacks an Approval of type "REK"
        # A "REK" Approved project is a Health Project. 
        # See health_related_projects.feature for details.
        When they click the Edit button
        Then User sees the Project Wizard
        And it contains data about the Project

    @xxx
    Scenario Outline: User opens Participants tab for Project
        Given User sees the Project Wizard
        And User has one of these role in the project:
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
        When they click the Participants tab
        Then they see lists of:
            | Project Managers     |
            | Project Participants |
        And they see Button Add Project Participant
        And they see a Previous Button
        And they see a Support Button
        And they see a Button "<Button>" decided by Project's "<Status>"
        And they see a Next Button
        Examples:
            | Status    | Button                   |
            | Draft     | Save draft               |
            | Published | Update published project |

    @xxx
    Scenario: Privileged user opens Participants tab for Project
        Given User opens Participants tab for Project
        When User has one of these roles in the project:
            | Curator               |
            | Project Owner         |
            | Project Manager       |
        Then they see Button Add Project Manager

    @xxxa
    Scenario Outline: Privileged user opens Dialog for adding Project Manager
        Given Privileged user opens Participants tab for Project
        And User has one of these role in the project:
            | Curator         |
            | Project Owner   |
            | Project Manager |
        When they click the Add Project Manager Button
        Then they see fields:
            | Start Date  |
            | User search |

    @xxxb
    Scenario: Privileged user adds a Project Manager
        Given Privileged user opens Dialog for adding Project Manager
        When they select a Start Date
        And they enter a name in the User search field
        And they select a User from the search
        And they click the Add Button
        Then they see the User listed as a Project Manager

    @xxx
    Scenario Outline: User opens Dialog for adding Project Participant
        Given User opens Participants tab for Project
        And User has one of these role in the project:
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
        When they click the Add Project Participant Button
        Then they can select role to be either of:
            | Project Partcipant    |
            | Local Project Manager |
        And they can see User search field

    @xxx
    Scenario: User adds a Project Participant
        Given User opens Dialog for adding Project Participant
        When they enter a name in the User search field
        And they select a role
        And they select a User from the search
        And they click the Add Button
        Then they see the User listed as a Project Participant

    @xxx
    Scenario Outline: User opens Financing tab for Project
        Given User sees the Project Wizard
        And User has the "<Role>" role in the project
        When they click the Financing tab
        Then they see fields for:
            | Financing Code |
        And the fields are "<FieldStatus>"
        And they see a Previous Button
        And they see a Support Button
        And they see a Save and Present Button
        Examples:
            | Role                  | FieldStatus |
            | Curator               | Enabled     |
            | Project Owner         | Enabled     |
            | Project Manager       | Enabled     |
            | Local Project Manager | Disabled    |

    @xxx
    Scenario: User adds a Financing source for Project
        Given User opens Financing tab for Project
        When they enter a search text in the search field
        And they select a Financing source from the search results
        Then they see that the Financing Code is added to the project

    @xxx
    Scenario: User Save a Project draft
        Given User sees the Project Wizard
        And User has one of these role in the project:
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
        When the User clicks on the Save draft Button
        Then the project is saved with a Draft status
        And the User is notified of result
