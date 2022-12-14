Feature: User My Projects

    In order to achive a low mental load on the user
    As Product Owner
    I want to achive a high degree of recognition between the design of My Projects and My Publications - both paret of My Page - accessible from the top menu

    In order to know of all project where I'm involved
    As a User
    I want to see lists of active and concluded projects, and have access to manage those I'm responsible of

    In order to keep projects I'm responsible of up to date
    As a User
    I want to see lists of draft projects, and have easy access to compleate and publish them

    In order to keep projects I'm responsible of up to date
    As a User
    I want easy access to manage those

    In order to see all details of a project
    As a User
    I want easy access to the landing page

    In order to locate the project in mind
    As a User
    I want easy access to search in My Projects

    In order to create new projects
    As a User
    I want easy access to create new projects

    Background:
        Given A User is logged in
        And the User got one of the following roles:
            | Registrator           |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
            | Participants          |

    @TEST_NP-4091
    @2874a
    Scenario: User navigate to My Page and selects Project registrations
        When a User navigate to My Page and selects Project registrations
        Then the User sees all active projects where the User has one of the following roles:
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
            | Participants          |
        And the User has an option to create a new project
        And the User see a search field to locate projects
        And the User can select a list of Active Projects
        And the User can select a list of Concluded Projects
        And the User can select a list of Draft Projects

    @2874b
    Scenario: User inspects a listed Project
        Given User navigate to My Page and selects Project registrations
        When the User inspects a listed project
        Then the User see can see each Project's:
            | Type                     |
            | Title                    |
            | Project participants     |
            | Coordinating Institution |
            | Status                   |
        And each Project can be edited if the User has one of the following roles:
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
        And the list can be sorted by:
            | Title                    |
            | Coordinating Institution |
            | Project category         |

    @TEST_NP-4088
    @2874c
    Scenario: User opens a Project's Landing Page
        Given User navigate to My Page and selects Project registrations
        When the User selects a Project's presentation area/line in table
        Then the User is presented the Landing Page for the Project

    @TEST_NP-4084
    @2874d
    Scenario: User Edits a Project in the Project Wizard
        Given User navigate to My Page and selects Project registrations
        When the User activate the option to Edit a project
        Then the Project is opend in the Project Wizard

    @TEST_NP-4086
    @2875
    Scenario: User search in My Projects
        When a User enter a search term in the search field on My Projects
        Then the User see Projects matching the search term in the Project's:
            | Title                    |
            | Coordinating Institution |
            | Participants             |
