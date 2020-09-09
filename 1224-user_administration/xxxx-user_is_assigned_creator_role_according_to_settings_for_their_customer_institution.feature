    @xxxx
    Scenario Outline: User is assigned the Creator role according to settings for their Customer Institution
        Given that the User is logged in
        And the user's Customer Institution is set to assign the Creator role for users with Feide roles <FeideRole>
        And the user's Feide account has roles <FeideRole>
        Then the user is assigned the Creator role
        Examples:
            | FeideRole                 |
            | member, employee, faculty |
            | member, employee, staff   |