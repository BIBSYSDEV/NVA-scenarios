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

    @512
    Scenario: A Curator approves a DOI request
        Given Curator opens a Registration from a DOI Request
        When they click Create DOI
        Then they see the Public Page for Publication
        And the Publication has a DOI Link
        And the Request DOI item is marked as Approved in their Worklist

    @1244
    Scenario: Curator declines a DOI request
        Given that a user is logged in as Curator
        And they open My Worklist page
        And they open a DOI request item in the Worklist
        And they click "Go to registration"
        And they see the Landing Page for the DOI Request's Registration
        When they click Decline DOI
        And they see the Decline DOI Dialog
        And they click Save
        Then they see the DOI request is removed from their Worklist
        And the DOI request is marked as "Declined" in the Owners' Worklist

    @1243
    Scenario: Curator writes a message when declining a DOI request
        Given that a user is logged in as Curator
        And they open My Worklist page
        And they open a DOI request item in the Worklist
        And they click "Go to registration"
        And they see the Landing Page for the DOI Request's Registration 
        When they click Decline DOI
        Then they see the Decline DOI Dialog
        And they write a message about why the DOI is declined
        And they click Save
        And the Owner see the message in the Owners' Worklist
