Feature: Owner navigates to the Landing Page of a drafted Registration without DOI

    @test
    @1233
    Scenario: Owner navigates to the Landing Page of a drafted Registration without DOI
        Given that an Owner views the Landing Page for their Registration
        And the Registration has status Draft
        And the Registration has no DOI
        When they look at the Status Bar
        Then they see buttons for Reserve a DOI and Edit Registration
