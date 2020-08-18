    @1238
    Scenario: Creator opens My Worklist
        Given that the user is logged in as Creator
        When they click the menu item My Worklist
        Then they see My Worklist page
        And they see a list with column headers
            | Title     |
            | Type      |
            | Submitter |
            | Date      |
        And they see that each row in the list has a Show, Open and Delete button
