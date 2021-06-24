Feature: User removes an ORCID connection from My Profile

    @test
    @383
    Scenario: User removes an ORCID connection from My Profile
        Given user opens the page My Profile
        When they click Remove ORCID
        Then they see a confirmation that the ORCID is removed