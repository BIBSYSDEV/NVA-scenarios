Feature: User My Projects

    In order to achive a low mental load on the user
    As Product Owner
    I want to achive a high degree of recognition between the design of My Projects and My Publications - both accessible from the top menu

    In order to know of all project where I'm involved
    As a User
    I want to see lists of active and concluded projects, and have access to manage those I'm responsible of

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

    @2874a
    @updated
    Scenario: User opens My Projects
        When a User navigate to My Projects Page
        Then the User see a option to create a new project
        And the User see a search field
        And the User see a list of Active Projects
        And the User see a collapsed list of Concluded Projects
        And the lists contains Projects where the User has one of the following roles:
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
            | Participants          |
        And the User can see each Project's:
            | Title                    |
            | Coordinating Institution |
            | Project Manager          |
        And each Project can be edited if the User has one of the following roles: 
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
        And the list can be sorted by:
            | Title                    |
            | Coordinating Institution |
            | Project Manager          |
        And the User can navigate through the possibly long list of Concluded Projects
    
    @2874b
    Scenario: User opens a Project's Landing Page
        Given User opens My Projects
        When the User click a Project's Title 
        Then the User see the Landing Page for the Project

    @2874c
    Scenario: User Edits a Project in the Project Wizard
        When a User edits a project from My Projects
        And the User has one of the following roles: 
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
        Then they see the Project in the Project Wizard

    @2875
    Scenario: User search in My Projects
        When a User enter a search term in the search field on My Projects
        Then the User see Projects matching the search term in the Project's:
            | Title                    |
            | Coordinating Institution |
            | Participants             |