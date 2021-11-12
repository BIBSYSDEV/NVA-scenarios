Feature: Request/Draft DOI button is disabled for Publications with existing DOI

    @test
    @1242
    Scenario: Request/Draft DOI button is disabled for Publications with existing DOI
        Given that a Creator views the Landing Page for a Publication
        And they are the Owner of this Publication
        And the Publication has a DOI
        When they see the Status Bar
        Then they see that the "Reserve a DOI" button is not visible
# A Publication may have more than one DOI, but NVA is only source for one DOI for each Publication
