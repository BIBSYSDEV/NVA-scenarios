Feature: Creator views details of an item in the Messages list

    @1246
    Scenario: Creator views details of an item in the Messages list
        Given that the Creator opens My Messages
        When they expand an item
        Then they see the item is expanded
        And they see the Publication title
        And they see the request type
        And they see the request status
        And they see a list of Messages between Creator and Curator with fields:
            | Message   |
            | Submitter |
            | Date      |
        And they see an input field for Answer
        And they see buttons
            | Send Answer       |
            | Go to Publication |
            | Archive           |