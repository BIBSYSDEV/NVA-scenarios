Feature: Owner opens the "Request a DOI" dialog

    @511
    Scenario: Owner opens the "Request a DOI" dialog
        Given that a Creator navigates to the Public Page for Publication for published publication without DOI
        And they are the Owner of this Publication
        When they click the "Request a DOI" button
        Then the "Request a DOI dialog" is opened
        And they see fields for Message
        And they see a "Send Request" button