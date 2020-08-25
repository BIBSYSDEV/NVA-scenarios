    @1252
    Scenario: Curator views details of a Worklist item
        Given that a Curator views DOI request tab
        When they expand the item
        Then they see the item is expanded
        And they see the Title of the Publication
        And they see the DOI request status
        And they see a list of Messages with fields:
            | Message   |
            | Submitter |
            | Date      |
        And they see an input field for Answer
        And they see buttons
            | Send answer       |
            | Go to publication |
            | Archive           |