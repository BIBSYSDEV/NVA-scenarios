Feature: Curator opens My Worklist

    @357
    Scenario: Curator opens My Worklist
        Given that the user is logged in as Curator
        When they click the menu item My Worklist
        Then they see My Worklist page
        And they see the tabs:
            | For Approval |
            | Support      |
            | DOI request  |
        And they see the For Approval page

    @1353
    Scenario: Curator views For Approval tab
        Given that the Curator opens My Worklist
        When they click the tab "For Approval"
        Then they see a list of Worklist Items with fields:
            | Request status     |
            | Registration title |
            | Submitter name     |
            | Date               |
        And they see that each Worklist Item has an Expand button

    @1354
    Scenario: Curator views Support tab
        Given that the Curator opens My Worklist
        When they click the tab "Support"
        Then they see a list of Worklist Items with fields:
            | Request status     |
            | Registration title |
            | Submitter name     |
            | Date               |
        And the see that each Worklist Item has an Expand button

    @531
    Scenario: Curator views DOI Request tab
        Given that the Curator opens My Worklist
        When they click the tab "DOI request"
        Then they see a list of Worklist Items with fields:
            | Request status     |
            | Registration title |
            | Submitter name     |
            | Date               |
        And the see that each Worklist Item has an Expand button
