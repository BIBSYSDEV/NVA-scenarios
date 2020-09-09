    @358
    Scenario: Curator opens a Publication from a DOI Request
        Given that a Curator views their Worklist
        And they have selected the DOI Requests tab
        And they have expanded an item (DOI Request)
        And they can see the optional message from the Owner
        When they click Go to Publication
        Then they see the DOI Request's Publication is opened in the Wizard
        And they see the Submission tab
        And the Create DOI button is enabled
        And the Decline DOI button is enabled
        And the Save and Present button is enabled