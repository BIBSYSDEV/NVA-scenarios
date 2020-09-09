    @1233
    Scenario: Owner navigates to the landing page of a drafted publication without DOI
        Given that an Owner views the landing page for their Publication
        And the publication has status Draft
        And the publication has no DOI
        When they look at the Status Bar
        Then they see buttons for Draft a DOI and Edit publication
