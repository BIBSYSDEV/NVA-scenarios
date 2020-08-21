    @358
    Scenario: Curator opens a Publication from a DOI Request Worklist Item
        Given that a Curator views details of a Worklist item
        And the item is a DOI request
        When they click "Go to Publication"
        Then they see the Publication is opened in the Wizard
        And they see the Submission tab
        And they see the Create DOI button is enabled
        And they see the Decline DOI button is enabled