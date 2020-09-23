Feature: Creator Edits a comment on a DOI request

    @1247
    Scenario: Creator Edits a comment on a DOI request
        Given that the Creator Opens a DOI request entry from My Worklist
        And the request has status Requested
        When they click the Edit button on a DOI request
        Then they can edit the comment
        And they see a Save button
