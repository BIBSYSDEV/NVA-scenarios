Feature: Application Administrator opens Institutions

    @TEST_NP-4161
    @test
    @365
    Scenario: Application Administrator opens Institutions
        Given that the user is logged in as Application Administrator
        When they click the menu item Institutions
        Then they see the page Institutions
        And they see a table of all Institutions (customers)
        And they see the table contains the fields
            | Name |
            | Date |
        And they see a button Edit that is enabled for each Institution
        And they see a button Add institution that is enabled
