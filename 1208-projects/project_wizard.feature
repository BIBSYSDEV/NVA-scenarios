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
        And the User got one of the following roles in the project: 
            | Curator               |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |

   @needJiraNumber
   Scenario Outline: User view my Projects
       When the User edits a Project in the Project Wizard 
       Then the User can navigate the project wizard’s sections:
           | Description |
           | Participants |
           | Financing    |
       And the User can request Support from his Curator
       And the User see an option to exit the wizard
       And th User see a Button "<Button>" decided by the Projects "<Status"
       Examples:
           | Status    | Button                   
           | Draft     | Save draft               |
           | Published | Update published project |

    Rule: Any User can create a project, becoming origin Project Owner

        @2903a
        @updated
        Scenario: User creates a new Project
            When the User creates a new Project in My Projects
            Then the User can fill in the following fields in the Description section:
                | Title                    |
                | Summary                  |
                | Coordinating Institution |
                | Start Date               |
                | End Date                 |
                | Internal Project Code    |
            And the User is the Project Owner

    Rule: A project got Participents, like the Local Project Manager

        @2906a
        @updated, replaces 2906b
        Scenario: User opens the Projects Participants section
            Given a User with one of these roles:
                | Curator               |
                | Project Owner         |
                | Project Manager       |
                | Local Project Manager |
            When the User views the Participants of a Project
            Then the User see lists of:
                | Project Managers     |
                | Project Participants |
            And the User see an option to add Project Participants
           
        @2906c
        Scenario: User adds a Project Participant
            When the User enter a name in a search field
            And the User selects a User from the search results
            And the User grants this User one of the following roles:
                | Local Project Manager |
                | Project Member        |
            Then they see the User listed as a Project Participant with a role

    Rule: The Project Owner, the Project Manager and Curator at the Coordinating Institution can grant the Project Manager role to any user, but there can only be one Project Manager at any time
    
        @2907a
        @updated, replaces also 2907b and 2907c
        Scenario Outline: A User adds a new Project Manager
            Given a User with role "<Role>" in the project
            When the User selects a User from a search
            And the User grants this User the role:
                | Project Manager |
            And the User set a Start Date not predating any former Project Managers
            Then the selected User is listed as Project Manager from Start Date
            Examples:
                | Role            |
                | Curator         |
                | Project Owner   |
                | Project Manager |

    Rule: A project can only have one Project Owner, Project Manager and Coordinating Institution - at any given time

        @needJiraNumber
        Scenario: Missing scenario to fulfil this rule
            When someone fil it in
            Then something happens

    Rule: A project may have several sources of funding. Warning: Funding organizations consider their funding to be a project and/or a grant, but from our point of view - it's only a part of the projects total funding.

        @2908a
        @updated
        Scenario Outline: User opens Financing tab for Project
            When a User with role "<Role>" on the project view the Financing tab
            Then the Financing Code field is "<FieldStatus>"
            Examples:
                | Role                  | FieldStatus |
                | Curator               | Enabled     |
                | Project Owner         | Enabled     |
                | Project Manager       | Enabled     |
                | Local Project Manager | Disabled    |

        @2908b
        Scenario: User adds a Financing source for Project
            When a User enter some text in the Financing Code field
            And the User select a Financing source from the search results
            #https://prosjektbanken.forskningsradet.no/prosjektbanken/rest/cristin/search?query=111
            #https://beta.explore.openaire.eu/search/advanced/projects?q=&op=and
            Then the User see the selected Financing Code listed as on of the Projects Financing Codes 
    
        @2909
        @deleted Scenario

    Rule: The Projects Coordinating Institution grants it's Curators access to the project

        @2905
        Scenario: Curator edit a Project in the Project Wizard
            Given a Curator on the Project's Coordinating Institution
            When the Curator opens the Project in the Project Wizard
            Then the Curator can manage the Projects data