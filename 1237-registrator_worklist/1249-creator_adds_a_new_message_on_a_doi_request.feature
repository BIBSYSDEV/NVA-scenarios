Feature: Creator adds a new message on a DOI request

    @1249
    Scenario: Creator adds a new message on a DOI request
        Given that a Creator is logged in
        And they open My Messages
        And they expand a DOI request
        And they see a list of messages between Creator and Curator(s)
        When they enter a new message
        And they click the Send Answer button
        Then they see that the new message is added to the list of messages
