Feature: Creator Opens a DOI request entry from My Worklist

    @1246
    Scenario: Creator Opens a DOI request entry from My Worklist
        Given that the Creator opens My Worklist
        When they click the Open button on a DOI request
        Then they see the Request Detail box
        And they see a summary of the Publication
        And they see a all the messages for this DOI request
        And they see a Back, Edit, and a Edit Publication button