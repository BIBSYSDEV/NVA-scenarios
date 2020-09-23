Feature: Creator opens a Publication with a DOI request

    @1251
    Scenario: Creator opens a Publication with a DOI request
        Given that the Creator Opens a DOI request entry from My Worklist
        When they click the Edit publication button
        Then the Publication is opened in the Wizard on the first tab