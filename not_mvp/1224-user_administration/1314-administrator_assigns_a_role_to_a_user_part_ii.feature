Feature: Administrator assigns a Role to a User (Part II)

    @1314
    Scenario Outline: Administrator assigns a Role to a User (Part II)
        Given that the user is logged in as Administrator
        And they are on the User Administration Page
        When they click Add User under the <Section>
        Then they see a new row in the <Section> with fields:
            | Authentication ID |
            | Name              |
        And they see an Add button
        Examples:
            | Section       |
            | Administrator |
            | Curator       |
            | Editor        |