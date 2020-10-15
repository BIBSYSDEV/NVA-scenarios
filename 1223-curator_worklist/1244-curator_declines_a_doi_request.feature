Feature: Curator declines a DOI request

    @1244
    Scenario: Curator declines a DOI request
        Given that a user is logged in as Curator
        And they open My Worklist page
        And they open a DOI request item in the Worklist
        When they click Decline DOI
        And they see the Decline DOI Dialog
        And they click Save
        Then the DOI request is marked as "Declined" in the Owners's Worklist
        And they see the DOI request is removed from their Worklist