    @363
    Scenario Outline: Administrator opens the Add Role Page (Part I)
        Given that the User is logged in as Administrator
        And they are on the User Administration Page
        When they click Add Role under the <Section>
        Then they see the Add Role Page with fields:
            | Authentication ID |
        And they see Search Fields for first name and last name
        And they see a Search button
        Examples:
            | Section       |
            | Administrator |
            | Curator       |
            | Editor        |