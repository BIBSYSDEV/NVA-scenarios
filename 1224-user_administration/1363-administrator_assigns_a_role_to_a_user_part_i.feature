Feature: Administrator assigns a Role to a User (Part I)

    @1363
    Scenario Outline: Administrator assigns a Role to a User (Part I)
        Given that the Administrator searches for User
        When they click the "<Button>" for a User
        Then the Add Role Dialog is closed
        And the User Administration Page is opened
        And they see that the User has got the "<Role>" role
        Examples:
            | Button            | Role          |
            | Add Administrator | Administrator |
            | Add Curator       | Curator       |
            | Add Editor        | Editor        |