Feature: Administrator searches for User

    @1362
    Scenario Outline: Administrator searches for User
        Given that the User is logged in as Administrator
        And they are on the User Administration Page
        When they click the Add "<Role>" button
        And they execute a search for the employee "Kari"
        Then they see the Search result for "Kari" with Authentication ID
        And they see an Add Role button for each row
        Examples:
            | Role          |
            | Administrator |
            | Curator       |
            | Editor        |