Feature: User My Projects

    @2874
    Scenario Outline: User opens My Projects
        Given that a User is logged in
        When they navigate to the My Projects Page
        Then they see a Create New Project Button
        And they see a search field
        And they see a list of Active Projects
        And they see a collapsed list of Concluded Projects
        And the lists contains Projects where the User has the role as:
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
            | Participants          |
        And each Project has:
            | Title           |
            | Institution     |
            | Project Manager |
        And each Project has an Edit button if the User has "<Role>" 
        And the list can be sorted by:
            | Title           |
            | Institution     |
            | Project Manager |
        And they see pagination buttons for the Concluded Projects list
        Examples:
            | Role                  |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |
    
    Scenario: User opens a Project's Landing Page
        Given User opens My Projects
        When they click a Project's Title 
        Then they see the Landing Page for the Project

    Scenario Outline: User Edits a Project in Project Wizard
        Given User has "<Role>" on the Project
        When they click the Edit Button 
        Then they see the Project in the Project Wizard
        Examples:
            | Role                  |
            | Project Owner         |
            | Project Manager       |
            | Local Project Manager |

    @2875
    Scenario: User search in My Projects
        Given User opens My Projects
        When they enter a search term in the search field
        Then they see Projects matching the search term in the Project's:
            | Title        |
            | Institution  |
            | Participants |
