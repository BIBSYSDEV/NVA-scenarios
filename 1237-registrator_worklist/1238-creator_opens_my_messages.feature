Feature: Creator opens My Messages

    @1238
    Scenario Outline: Creator opens My Messages
        Given that the user is logged in as Creator
        When they click the menu item My Messages
        Then they see the My Messages page
        And they see a list of <MessageType> with fields:
            | Publication title |
            | Date              |
            | Request status    |
        And they see that each item in the list is expandable
        Examples:
            | MessageType |
            | DoiRequests |