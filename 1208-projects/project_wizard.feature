Feature: User edits Project
# First three lines cover Why, Who, and What, following scenarios covers the How
In order to document vital parts of a project 
As a logged in User or as a Curator
I want to edit all details and be able do define a new project 

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
    Scenario Outline: User opens a Project in the Project Wizard
        Given User has the "<Role>" role in the project's scope
        And the project lacks an Approval of type "REK"
        # A "REK" Approved project is a Health Project. 
        # See health_related_projects.feature for details.
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
    Scenario Outline: User opens Participants tab for Project
        Given User sees the Project Wizard
        And User has the "<Role>" role in the project's scope
        When they click the Participants tab
        Then they see lists of:
            | Project Managers     |
            | Project Participants |
        And they see Buttons:
            | Add Project Manager     |
            | Add Project Participant |
        And they see a Previous Button
        And they see a Support Button
        And they see a Save Button
        And they see a Next Button
        Examples:
            | Role                  |
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |

    @xxxa
    Scenario Outline: User opens Dialog for adding Project Manager
        Given User opens Participants tab for Project
        And User has the "<Role>" role in the project's scope
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
        And User has the "<Role>" role in the project's scope
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
        And User has the "<Role>" role in the project's scope
        When they click the Financing tab
        Then they see fields for:
            | Financing Code |
        And they see a Previous Button
        And they see a Support Button
        And they see a Publish Button
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
        And they see a Publish Button

    @xxx
    # Vi må unngå at ein bruker trykker Save på eit publisert prosjekt og trur at han har publisert endringer på prosjektet. Skal vi endre/fjerne Save knapp, når prosjektet er publisert - eller endre logikken til eit publisert prosjekt?
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
