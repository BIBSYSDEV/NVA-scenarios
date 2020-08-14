    @1242
    Scenario: Request/Draft Doi buttion is disabled for Publications with existing DOI
        Given that the Creator navigates to the Public Page for Publication
        And they are the Owner of this Publication
        And the Publication has a DOI
        When they see the Status Bar
        Then they see that the Request/Draft DOI button is disabled
# a Publication may have more then one DOI,
# but NVA is only source for one DOI for each Publication
