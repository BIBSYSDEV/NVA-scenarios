    @1240
    Scenario: Creator deletes a DOI request
        Given that the Creator opens My Worklist
        When they click the Delete button on a DOI request
        Then the request is deleted from their Worklist
        And the request is deleted from the Worklist of their Curator
        And the Public Page for Publication has an enabled "Request DOI" button
