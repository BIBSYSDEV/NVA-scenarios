    @1375
    Scenario: Curator views DOI Request tab (Part II)
        Given that the user opens My Worklist
        When they click the tab:
            | DOI request |
        Then they see a list with expandable items with fields:
            | DOI Request Status |
            | Publication Title  |
            | Messages           |
            | Submitter          |
            | Date               |
        And they see that each row in the list has an Expand button