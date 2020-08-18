    @1252
    Scenario: Curator expands an item in the Worklist
        Given that a Curator views DOI Request tab (Part II)
        When they click Expand on an item
        Then they see the item is expanded
        And they see the Title of the Publication
        And they see the Message from the User
        And they see buttons
            | Send Answer       |
            | Go to Publication |
            | Archive           |