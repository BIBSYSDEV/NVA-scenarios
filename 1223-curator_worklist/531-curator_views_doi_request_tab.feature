    @531
    Scenario: Curator views DOI Request tab
        Given that the user opens My Worklist (Part I)
        When they click the tab:
            | DOI request |
        Then they see a list with expandable items with fields:
            | Status    |
            | Title     |
            | Message   |
            | Submitter |
            | Date      |
        And they see that each row in the list has an Expand button