Feature: Creator views details of an item in the Messages list

    @TEST_NP-4147
    @1246
    Scenario Outline: Creator views details of an item in the Messages list
        Given that the Creator opens My Messages
        When they expand an item
        Then they see the item is expanded
        And they see the item's Publication title
        And they see the item is related to a "<RequestType>"
        And they see the item's status is one of "<RequestStatus>"
        And they see a list of Messages between Creator and Curator with fields:
            | Message   |
            | Submitter |
            | Date      |
        And they see an input field for Answer
        And they see buttons
            | Send Answer       |
            | Go to Publication |
            | Archive           |
        Examples:
            | RequestType | RequestStatus                 |
            | DoiRequests | Approved, Rejected, Requested |