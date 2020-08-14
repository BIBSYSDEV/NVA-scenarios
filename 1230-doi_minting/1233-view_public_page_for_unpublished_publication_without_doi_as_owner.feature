    @1233
    Scenario: Owner navigates to the Public Page for Publication for unpublished publication without DOI
        Given that the Owner view Public Page for Publication for publication
        And the publication is not Published
        And the publication has no DOI
        When they look at the Status Bar
        Then they see buttons for Draft a DOI and Edit publication