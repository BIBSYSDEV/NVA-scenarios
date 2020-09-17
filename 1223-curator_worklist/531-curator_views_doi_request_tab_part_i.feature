Feature: Curator views DOI request tab

    @531
    Scenario: Curator views DOI request tab
        Given that the Curator opens My Worklist (Part I)
        When they click the tab "DOI request"
        Then they see a list of Worklist Items with fields:
            | DOI request status |
            | Publication title  |
            | Submitter          |
            | Date               |
        And the see that each Worklist Item has an Expand button