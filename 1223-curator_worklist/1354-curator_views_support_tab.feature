    @1354
    Scenario: Curator views Support tab
        Given that the Curator opens My Worklist (Part II)
        When they click the tab:
            | Support |
        Then they see a list with expandable items with fields:
            | Status    |
            | Title     |
            | Message   |
            | Submitter |
            | Date      |
        And they see that each row in the list has an Expand button