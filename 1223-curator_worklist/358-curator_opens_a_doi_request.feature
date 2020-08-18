    @358
    Scenario: Curator opens a DOI request
        Given that a Curator expands an item in the Worklist
        And the item is a DOI request
        And they read the optional message from the Owner
        When they click Go to Publication
        Then they see the item is opened in the Wizard
        And they see the Submission tab
        And they see the Create DOI button is enabled
        And they see the Decline DOI button is enabled