Feature: Curator opens a Registration from a DOI Request

    @TEST_NP-4127
    @test
    @358
    Scenario: Curator opens a Registration from a DOI Request
        Given that a Curator views their Worklist
        And they have selected the DOI Requests tab
        And they have expanded an Message
        When they click "Go to registration"
        Then they see the Landing Page for the DOI Request's Registration
        And the Create DOI button is enabled
        And the Decline DOI button is enabled

    @TEST_NP-4132
    @512
    Scenario: A Curator approves a DOI request
        Given Curator opens a Registration from a DOI Request
        When they click the Create DOI button
        Then they see the Landing Page for Registration
        And the Registration has a DOI Link
        And the Message is marked as Approved in their Worklist

    @TEST_NP-4126
    @1244
    Scenario: Curator declines a DOI request
        Given Curator opens a Registration from a DOI Request
        When they click Decline DOI
        Then they see a input field to send a decline Message to the requester
        And the Message is marked as Declined in their Worklist