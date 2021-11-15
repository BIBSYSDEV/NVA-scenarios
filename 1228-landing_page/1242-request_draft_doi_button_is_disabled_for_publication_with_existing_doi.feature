Feature: Request/Draft DOI button is disabled for Registrations with existing DOI

    @test
    @1242
    Scenario Outline: Request/Draft DOI button is disabled for Registrations with existing DOI
        Given that a Creator views the Landing Page for a Registration|
        And they are the Owner of this Registration
        And the Registration has status "<status>"
        And the Registration has a DOI
        When they see the Status Bar
        Then they see that the "<button>" button is not visible
    Examples:
        | status    | button      |
        | Draft     | Reserve DOI |
        | Published | Request DOI |
# A Publication may have more than one DOI, but NVA is only source for one DOI for each Publication
