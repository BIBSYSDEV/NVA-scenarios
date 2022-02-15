Feature: Request/Draft DOI button is disabled for Registrations with existing DOI

    @TEST_NP-4165
    @test
    @1242
    Scenario Outline: Request/Draft DOI button is disabled for Registrations with existing DOI
        Given that a Creator views the Landing Page for a Registration
        And they are the Owner of this Registration
        And the Registration has status "<Status>"
        And the Registration has a DOI
        When they see the Status Bar
        Then they see that the "<Button>" button is not visible
        Examples:
            | Status    | Button        |
            | Draft     | Reserve a DOI |
            | Published | Request a DOI |
# A Publication may have more than one DOI, but NVA is only source for one DOI for each Publication
