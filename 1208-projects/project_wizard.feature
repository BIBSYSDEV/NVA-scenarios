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
        And User has the "<Role>" role in the project
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
            | Role                  | Status    | Button                   |
            | Curator               | Published | Update published project |
            | Curator               | Draft     | Save draft               |
            | Project Owner         | Published | Update published project |
            | Project Owner         | Draft     | Save draft               |
            | Project Manager       | Published | Update published project |
            | Project Manager       | Draft     | Save draft               |
            | Local Project Manager | Published | Update published project |
            | Local Project Manager | Draft     | Save draft               |

    @xxx
    Scenario: Privileged user opens Participants tab for Project
        Given User opens Participants tab for Project
        And User has the "<Role>" role in the project
        When they click the Participants tab
        Then they see Button Add Project Manager
        Examples:
            | Role                  |
            | Curator               |
            | Project Owner         |
            | Project Manager       |

    @xxxa
    Scenario Outline: User opens Dialog for adding Project Manager
        Given User opens Participants tab for Project
        And User has the "<Role>" role in the project
        When they click the Add Project Manager Button
        Then they see fields:
            | Start Date  |
            | User search |
        Examples:
            | Role            |
            | Curator         |
            | Project Owner   |
            | Project Manager |

    @xxxb
    Scenario: User adds a Project Manager
        Given User opens Dialog for adding Project Manager
        When they select a Start Date
        And they enter a name in the User search field
        And they select a User from the search
        And they click the Add Button
        Then they see the User listed as a Project Manager


    Scenario Outline: User opens Dialog for adding Project Participant
        Given User opens Participants tab for Project
        And User has the "<Role>" role in the project
        When they click the Add Project Participant Button
        Then they can select role to be either of:
            | Project Partcipant    |
            | Local Project Manager |
        And they can see User search field
        Examples:
            | Role                  |
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |

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
        And they see a Previous Button
        And they see a Support Button
        And they see a Save and Present Button
        Examples:
            | Role            |
            | Curator         |
            | Project Owner   |
            | Project Manager |

    @xxx
    Scenario: User adds a Financing source for Project
        Given User opens Financing tab for Project
        When they enter a search text in the search field
        And they select a Financing source from the search results
        Then they see that the Financing Code is added to the project
        And they see a Previous Button
        And they see a Support Button
        And they see a Save and Present Button

    @xxx
    Scenario: User Save a Project draft
    Given User sees the Project Wizard
    And User has the "<Role>" role in the project
    When the User clicks on the Save draft Button
    Then the project is saved with a Draft status
    And only the "<Role>" role in the project can access it's Landing Page 
        Examples:
            | Role                  |
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |

    @xxx
    Scenario: User Publish a Project
    Given User opens Landing Page for Project
    And User has the "<Role>" role in the project
    When the User clicks on the Publish Button
    Then the project status is now Published 
    And it has a public accessible Landing Page
        Examples:
            | Role            |
            | Curator         |
            | Project Owner   |
            | Project Manager |
