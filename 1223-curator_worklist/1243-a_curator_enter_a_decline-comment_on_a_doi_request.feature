    @1243
    Scenario: A Curator enter a decline-comment on a DOI request
        Given that a Curator opens an item in the Worklist
        And the item is a DOI request
        When they click Decline DOI
        Then they may enter a decline-comment