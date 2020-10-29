Feature: Creator adds a new message

    @1249
    Scenario: Creator adds a new message on a DOI request
        Given that a user is logged in as Creator
        And they open My Messages page
        And they open a DOI request in the messages list
        And they see previous messages between Creator and Curator(s) for the DOI request
        When they enter a new message
        And they click the Send Answer button
        Then they see that the new message is added to the list of messages

    @1746
    Scenario: Creator adds a new message on a Support request
        Given that a user is logged in as Creator
        And they open My Messages page
        And they open a Support request in the messages list
        And they see previous messages between Creator and Curator(s) for the Support request
        When they enter a new message
        And they click the Send Answer button
        Then they see that the new message is added to the list of messages