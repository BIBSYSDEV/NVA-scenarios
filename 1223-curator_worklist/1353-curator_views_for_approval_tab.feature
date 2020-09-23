Feature: Curator views For Approval tab

    @1353
    Scenario: Curator views For Approval tab
        Given that the Curator opens My Worklist (Part II)
        When they click the tab "For Approval"
        Then they see a list of Worklist items with fields:
            | Status    |
            | Title     |
            | Message   |
            | Submitter |
            | Date      |
        And they see each Worklist Item has an Expand button