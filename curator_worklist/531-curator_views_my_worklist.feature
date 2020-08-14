    @531
    Scenario: Curator views My Worklist tabs
        Given that the user opens My Worklist
        When they click the tabs:
            | For Approval |
            | Support      |
            | DOI request  |
        Then they see a list with column headers
            | Status    |
            | Title     |
            | Message   |
            | Submitter |
            | Date      |
        And they see that each row in the list has an Expand button