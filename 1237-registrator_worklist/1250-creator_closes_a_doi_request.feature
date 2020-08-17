    @1250
    Scenario: Creator closes a DOI request
        Given that the Creator Opens a DOI request entry from My Worklist
        When they click the Close button
        Then they see the Worklist
