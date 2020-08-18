    @1353
    Scenario: Curator views For Approval tab
        Given that the user opens My Worklist
        When they click the tab:
            | For Approval |
        Then they see a list with expandable items with fields:
            | Status    |
            | Title     |
            | Message   |
            | Submitter |
            | Date      |
        And they see that each row in the list has an Expand button