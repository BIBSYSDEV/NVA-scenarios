Feature: Owner drafts a DOI for a draft Registration

    @test
    @1234
    Scenario: Owner drafts a DOI for a draft Registration
        Given that an Owner views the Landing Page for their Registration
        And the Registration has status Draft
        And the Registration has no DOI
        When they click the "Reserve a DOI" button
        Then the "Reserve a DOI" button is no longer visible
        And the Landing Page for the Registration contains the Draft DOI
        And the drafted DOI is not clickable and marked "In progress"
# Draft DOIs are not acknowledged by the resolving mechanisms (Handle-system)
