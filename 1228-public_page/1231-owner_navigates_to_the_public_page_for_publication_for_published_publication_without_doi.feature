Feature: Owner navigates to the Public Page for Publication for published publication without DOI

    @1231
    Scenario: Owner navigates to the Public Page for Publication for published publication without DOI
        Given that the Creator navigates to the Public Page for Publication
        And they are the Owner of this Publication
        And the Publication has no DOI
        When they see the Status Bar
        Then they see buttons for "Request a DOI" and "Edit Publication"