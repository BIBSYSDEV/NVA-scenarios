    @1235
    Scenario: Owner navigates to the submission tab and publish a Publication with a drafted DOI
        Given that the Owner navigates to Submission tab
        And the Publication has status Draft
        And the Publication has a Draft DOI
        When the Owner clicks the publish button
        Then the Public Page for Publication is displayed
        And the "Request a DOI" button is still named "DOI pending" and is disabled
        And the Public Page for Publication lists the Draft DOI
        And the Draft DOI is still not a link
        And the DOI request is listed in the Owners work list
        And the DOI request is listed in the Curators work list