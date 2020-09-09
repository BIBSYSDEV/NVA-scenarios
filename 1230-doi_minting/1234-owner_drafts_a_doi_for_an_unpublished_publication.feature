    @1234
    Scenario: Owner drafts a DOI for a draft Publication
        Given that an Owner views the landing page for their Publication
        And the publication has status Draft
        And the publication has no DOI
        When they click the "Draft a DOI" button
        Then the "Draft a DOI" button is renamed to "DOI pending" and is disabled
        And the drafted DOI is added to the metadata
        And the landing page for the Publication contains the Draft DOI
        And the drafted DOI is not clickable
# Draft DOIs are not acknowledged by the resolving mechanisms (Handle-system)
