    @365
    Scenario: Application Administrator opens Institutions
        Given that the user is logged in as Application Administrator
        When they click the menu item Institutions
        Then they see the page Institutions
        And they see a table of all Institutions (customers)
        And they see the table contains the fields
            | Institution |
            | Created     |
            | Editor      |
        And they see a button Open that is enabled for each Institution
        And they see a button Create Institution that is enabled
