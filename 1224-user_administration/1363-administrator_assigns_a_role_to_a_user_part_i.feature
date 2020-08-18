    @1363
    Scenario: Administrator assigns a Role to a User (Part I)
        Given that the Administrator searches for User
        When they click the Add Role button for a User
        Then the Add Role Page is closed
        And the User Administration Page is opened
        And they see that the User has got the role