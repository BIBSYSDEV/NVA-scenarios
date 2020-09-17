Feature: Curator opens My Worklist (Part II)

    @1352
    Scenario: Curator opens My Worklist (Part II)
        Given that the user is logged in as Curator
        When they click the menu item My Worklist
        Then they see My Worklist page
        And they see the tabs:
            | For Approval |
            | Support      |
            | DOI request  |
        And they see the For Approval page