    @357
    Scenario: Curator opens My Worklist (Part I)
        Given that the user is logged in as Curator
        When they click the menu item My Worklist
        Then they see My Worklist page
        And they see the tab "DOI request"
        And they see the DOI request page
