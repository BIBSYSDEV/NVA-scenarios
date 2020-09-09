    @1233
    Scenario: Owner navigate to the landing page of a drafted publication without DOI
        Given that an Owner view landing page for its Publication
        And the publication has status Draft
        And the publication has no DOI
        When they look at the Status Bar
        Then they see buttons for Draft a DOI and Edit publication