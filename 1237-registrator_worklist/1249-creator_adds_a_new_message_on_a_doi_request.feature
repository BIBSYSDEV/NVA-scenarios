Feature: Creator adds a new message on a DOI request

    @1249
    Scenario: Creator adds a new message on a DOI request
        Given that the Creator views details of a DoiRequest in the Messages list
        And the request has an answer from a Curator
        And they see the message from the Curator
        When the Creator enters a new message
        And clicks the Send Answer button
        Then they can see that the new message is added to the list of messages