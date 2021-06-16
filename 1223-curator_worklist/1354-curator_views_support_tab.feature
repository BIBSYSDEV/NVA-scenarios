Feature: Curator views Support tab

    @1354
    Scenario: Curator views Support tab
        Given that the Curator opens My Worklist (Part II)
        When they click the tab "Support"
        Then they see a list of Worklist Items with fields:
            | Status    |
            | Title     |
            | Message   |
            | Submitter |
            | Date      |
        And they see each Worklist Item has an Expand button
        