Feature: Owner publishes a Publication with a Draft DOI

    @1235
    Scenario: Owner publishes a Publication with a Draft DOI
        Given that the Owner navigates to the Submission tab for a Publication
        And the Publication is not published
        And the Publication has a Draft DOI
        When the Owner clicks the Publish button
        Then they see the Publication's Landing Page
        And they see the "Request a DOI" button has text "DOI pending" and that it is disabled
        And they see the Draft DOI and that it is not clickable
        And the DOI request is listed in the Owner's Worklist
        And the DOI request is listed in the Curator's Worklist