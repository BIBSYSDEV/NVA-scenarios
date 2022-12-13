Feature: User edits Project

    In order to achieve a low mental load on the user
    As Product Owner
    I want the user to experience a high degree of recognition between the desing of Project's registration wizard and Publication’s registration wizard

    In order to manage a Project's content
    As a User
    I want to be able to manage all possible information about the Project in one place

    In most cases the Project Manager reside from the Coordinating Institution
    Vocabulary warning: Most funding organizations use the term "project" to describe (one of possible many) funding sources a project may have.

    Background:
        Given A User is logged in
        And the User got one of the following roles:
            | Registrator           |
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |

    #Rule: Any User (Registrator) can create a project, becoming origin Project Owner
    @TEST_NP-4022
    @2556
    Scenario: User opens the Project Wizard to register a new Project
        When the User selects Create new Project
        Then they see the Project Wizard start page
        And they can select:
            | Search for Financing |
            #| REK Approval         |
            | Empty registration   |
        And they see a Close option

    @24655a
    Scenario: User starts to register a Project with a suggested Financing from NFR
        Given User opens the Project Wizard to register a new Project
        When they activate the search field, a list of Financings where the user has a role is presented
        Then they selects a Financing
        And the Project Wizard opens pre-filled with metadata

    @24655b
    Scenario: User starts to register a Project with a located Financing from NFR
        Given User opens the Project Wizard to register a new Project
        When they activate the search field, a list of Financings where the user has a role is presented
        And they execute a search
        Then they selects a Financing
        And the Project Wizard opens pre-filled with metadata

    @24655c
    Scenario: User inspects the search result from information
        Given User opens the Project Wizard to register a new Project
        When the user inspects the suggested or located Financing from NFR
        Then the number of existing projects using the Financing is visible
        And the User may inspect witch projects is connected to this Financing

    @24656
    Scenario: User opens the Project Wizard and start registering a Project without Financing selected
        Given User opens the Project Wizard to register a new Project
        When they open the Project Wizard to register a new Project
        And they selects Empty registration
        Then the Project Wizard opens with no metadata pre-filled

    @24657
    Scenario: The User opens the Project Wizard on the Metadata page
        When the Wizard is opened on the Metadata page
        Then the User can fill in fields for:
            | Title                    |
            | Coordinating Institution |
            | Start date               |
            | End date                 |
        And the User can add:
            | Participants             |
            #| Approvals                |
            | Financing                |
        And they have an option to exit the Wizard
        And they have an option to go to the last page of the Wizard

    @24658
    Scenario: The User open the Project Wizard on the last page
        When the Wizard is opened on the last page
        Then the User can fill in fields for:
            | Project category     |
            | Description          |
            | Keywords             |
            | Project webpage      |
        And the User can add:
            | Data Management Plan |
            | Results              |
            | Associated Projects  |
        And the User have the option to save the Project

    #Rule: A project got Participents, like the Local Project Manager
    @TEST_NP-4285
    @2906a
    Scenario Outline: User views the Projects Participants section
        Given a User with "<Role>"
        When they views the Participants of a Project
        Then they see see an option to add Project Participants
    Examples:
        | Role                  |
        | Curator               |
        | Project Owner         |
        | Project Manager       |
        | Local Project Manager |

    @TEST_NP-4282
    @2906b
    Scenario: User adds a Project Participant
        Given User views the Projects Participants section
        When the User adds a Projects Participant
        And the User enter a name in a search field
        And the User selects a User from the search results
        And the User grants this User one of the following roles:
            | Local Project Manager |
            | Project Member        |
        Then they see the User listed as a Project Participant with the selected role

    #Rule: The Project Owner, the Project Manager and Curator at the Coordinating Institution can grant the Project Manager role to any user, but there can only be one Project Manager at any time
    @TEST_NP-4286
    @2907
    Scenario Outline: A User adds a new Project Manager
        Given a User with role "<Role>" in the project
        When the User selects a User from a search
        And the User grants this User the role:
            | Project Manager |
        Then the selected User is listed as Project Manager
        Examples:
            | Role            |
            | Curator         |
            | Project Owner   |
            | Project Manager |

    #Rule: A project can only have one Project Owner, Project Manager and Coordinating Institution - at any given time

    #Rule: A project may have several sources of funding. Warning: Funding organizations consider their funding to be a project and/or a grant, but from our point of view - it's only a part of the projects total funding.
    @TEST_NP-4283
    @2908a
    Scenario Outline: User views Financing tab for Project
        When a User with role "<Role>" on the project view the Financing tab
        Then the add new Financing option is "<FieldStatus>"
        Examples:
            | Role                  | FieldStatus |
            | Curator               | Enabled     |
            | Project Owner         | Enabled     |
            | Project Manager       | Enabled     |
            | Local Project Manager | Disabled    |

    @TEST_NP-4281
    @2908b
    Scenario: User adds a Financing source for Project
        Given User views Financing tab for Project
        When a User adds a new Financing
        And the User is presented a list of Financing sources
        And NFR is listed first
        Then the User selects a Financing source for Project
        And the selected Financing source is listed

    @2908c
    Scenario: User selects NFR as Financing source for Project
        Given User adds a Financing source for Project
        And the Financing source for Project is NFR
        #https://prosjektbanken.forskningsradet.no/prosjektbanken/rest/cristin/search?query=111
        #https://beta.explore.openaire.eu/search/advanced/projects?q=&op=and
        When they activate the search field, a list of Financings where the user has a role is presented
        Then they selects a Financing
        And the selected Financing title and ID is listed

    @2908d
    Scenario: User selects a non-NFR as Financing source for Project
        Given User adds a Financing source for Project
        And the Financing source for Project is not NFR
        And the selected Financing source for Project is presented
        And the User is presented following fields:
          | Title |
          | ID    |
          | Value |
        When the fieleds are filled in the Financing source ia stored
        And the add new Financing source option is activated

    #Rule: The Projects Coordinating Institution grants it's Curators access to the project
    @TEST_NP-4280
    @2905
    Scenario: Curator edit a Project in the Project Wizard
        Given a Curator on the Project's Coordinating Institution
        When the Curator opens the Project in the Project Wizard
        Then the Curator can manage the Projects data
