Feature: Curator writes a message when declining a DOI request

    @1243
    Scenario: Curator writes a message when declining a DOI request
        Given that a user is logged in as Curator
        And they open My Worklist page
        And they open a DOI request item in the Worklist
        When they click Decline DOI
        Then they see the Decline DOI Dialog
        And they can write a message about why the DOI is declined