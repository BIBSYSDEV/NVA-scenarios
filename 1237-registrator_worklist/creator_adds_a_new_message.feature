Feature: Creator adds a new message

    @1249
    Scenario: Creator adds a new message on a DOI request
        Given that a User is logged in as Creator
        And they open My Messages page
        And they open a DOI request item in the Messages list
        And they see previous messages between Creator and Curator(s)
        When they enter a new message
        And they click the Send Answer button
        Then they see that the new message is added to the Messages list

    @1746
    Scenario: Creator adds a new message on a Support request
        Given that a User is logged in as Creator
        And they open My Messages page
        And they open a Support request item in the Messages list
        And they see previous messages between Creator and Curator(s)
        When they enter a new message
        And they click the Send Answer button
        Then they see that the new message is added to the Messages list
