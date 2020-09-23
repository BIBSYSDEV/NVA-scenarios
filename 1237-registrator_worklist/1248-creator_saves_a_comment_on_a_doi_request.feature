Feature: Creator Saves a comment on a DOI request

    @1248
    Scenario: Creator Saves a comment on a DOI request
        Given that the Creator Edits a comment on a DOI request
        When they Save the comment
        Then the comment is saved
        And they see a confirmation message
        And they can no longer edit the comment