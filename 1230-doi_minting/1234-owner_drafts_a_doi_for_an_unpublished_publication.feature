    @1234
    Scenario: Owner drafts a DOI for an unpublished Publication
        Given that the Owner View Public Page for Publication for unpublished publication without DOI
        And they are the Owner of the Publication
        When they click the "Draft a DOI" button
        Then the Public Page for Publication is displayed
        And the "Draft a DOI" button is renamed to "DOI pending" and is disabled
        And the Draft DOI is added to the metadata
        And the Public Page for Publication contains the Draft DOI
        And the Draft DOI is not a link
#Draft DOIs are not acknowledged by the resolving mechanisms (Handle-system)
