    @1249
    Scenario: Creator adds a new message on a DOI request
        Given that the Creator Opens a DOI request entry from My Worklist
        And the request is Answered
        And they see the answer from the Curator
        When the they click the New Message button
        Then they can add a new message to the DOI request
        And the request changes status to Requested