    @1244
    Scenario: A Curator declines a DOI request
        Given that a Curator enters a decline comment on a DOI request
        When they click Save
        Then the DOI request is marked as "Declined"
        And the request in the User's Worklist is updated to "Declined"
        And the request is removed from the Curator's Worklist
        And they see their Worklist
