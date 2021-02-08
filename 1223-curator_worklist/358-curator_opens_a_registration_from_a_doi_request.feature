Feature: Curator opens a Registration from a DOI Request

    @358
    Scenario: Curator opens a Registration from a DOI Request
        Given that a Curator views their Worklist
        And they have selected the DOI Requests tab
        And they have expanded an item (DOI Request)
        When they click "Go to registration"
        Then they see the Landing Page for the DOI Request's Registration
        And the Create DOI button is enabled
        And the Decline DOI button is enabled
