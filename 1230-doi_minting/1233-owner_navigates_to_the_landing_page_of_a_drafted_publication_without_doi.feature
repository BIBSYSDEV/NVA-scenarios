Feature: Owner navigates to the Landing Page of a drafted Publication without DOI

    @1233
    Scenario: Owner navigates to the Landing Page of a drafted Publication without DOI
        Given that an Owner views the Landing Page for their Publication
        And the Publication has status Draft
        And the Publication has no DOI
        When they look at the Status Bar
        Then they see buttons for Draft a DOI and Edit Publication
